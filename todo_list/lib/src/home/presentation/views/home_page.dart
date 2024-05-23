import 'package:animated_tree_view/animated_tree_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_list/common/widgets/text_button.dart';
import 'package:todo_list/common/widgets/custom_text.dart';
import 'package:todo_list/core/utils/shared_storage.dart';
import 'package:todo_list/src/authentication/presentation/views/login_page.dart';
import 'package:todo_list/src/home/domain/entities/tasks_entity.dart';
import 'package:todo_list/src/home/domain/usecases/update_tasks.dart';
import 'package:todo_list/src/home/presentation/cubit/delete_tasks/delete_tasks_cubit.dart';
import 'package:todo_list/src/home/presentation/views/add_update_tasks_page.dart';
import 'package:todo_list/src/home/presentation/widgets/card_widget.dart';
import 'package:todo_list/src/home/presentation/widgets/shimmer_loading.dart';
import '../../../../common/widgets/alert_widget.dart';
import '../../../../core/style/color_app.dart';
import '../cubit/get_tasks/get_tasks_cubit.dart'; // Update this to your actual import

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  static const String homeRoute = "home-route";

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<GetTasksCubit>(context).getListTasks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.pushNamed(AddUpdateTasksPage.addTasksRoute);
        },
        child: const CustomTextNunito(
            text: "ADD",
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: ColorApp.black),
      ),
      appBar: AppBar(actions: [
        IconButton(onPressed: (){
          context.goNamed(LoginPage.loginRoute);
          SharedStorage.removeAuth();
        }, icon: const Icon(Icons.logout))
      ],),
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          BlocBuilder<GetTasksCubit, GetTasksState>(
            builder: (context, state) {
              if (state is GetTasksSuccess) {
                return SliverTreeView.simpleTyped<TreeData, TreeNode<TreeData>>(
                    tree: state.treeNode,
                    showRootNode: false,
                    builder: (context, node) {
                      if (node.data?.isTaskEntity == true) {
                        final items = node.data!.tasksEntity;
                        return Card(
                          child: Column(
                            children: [
                              ListTile(
                                title: Text("${items?.title}"),
                                leading: BlocConsumer<DeleteTasksCubit,
                                    DeleteTasksState>(
                                  listener: (context, state) {
                                    // TODO: implement listener
                                    if (state is DeleteTasksLoading) {
                                      showDialog(
                                          context: context,
                                          builder: (c) {
                                            return AlertWidget(
                                                title: const CustomTextNunito(
                                                    textAlign: TextAlign.center,
                                                    text: "Sedang menghapus",
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.w500,
                                                    color: ColorApp.black600));
                                          });
                                    } else if (state is DeleteTasksSuccess) {
                                      context
                                          .read<GetTasksCubit>()
                                          .getListTasks();
                                      context.pop();
                                      Fluttertoast.showToast(
                                          msg: state.message,
                                          backgroundColor:
                                              Colors.green.shade500);
                                    } else if (state is DeleteTasksFailed) {
                                      context.pop();
                                      Fluttertoast.showToast(
                                          msg: state.message,
                                          backgroundColor: ColorApp.red);
                                    }
                                  },
                                  builder: (context, state) {
                                    return IconButton(
                                        onPressed: () {
                                          showDialog(
                                              context: context,
                                              builder: (c) {
                                                return AlertWidget(
                                                  title: const CustomTextNunito(
                                                      textAlign:
                                                          TextAlign.center,
                                                      text:
                                                          "Anda yakin ingin menghapus tasks ini ?",
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: ColorApp.black600),
                                                  actions: [
                                                    TextButtonWidget(
                                                        title: "TIDAK",
                                                        onPress: () {
                                                          context.pop();
                                                        }),
                                                    TextButtonWidget(
                                                        title: "YA",
                                                        onPress: () {
                                                          context
                                                              .read<
                                                                  DeleteTasksCubit>()
                                                              .deleteTasks(
                                                                  items!.id!);
                                                          context.pop();
                                                        })
                                                  ],
                                                );
                                              });
                                        },
                                        icon: const Icon(Icons.delete));
                                  },
                                ),
                                trailing: InkWell(
                                  onTap: () {
                                    context.pushNamed(
                                        AddUpdateTasksPage.addTasksRoute,
                                        extra: UpdateTasksParams(
                                            id: items!.id!,
                                            title: items.title ?? "",
                                            description:
                                                items.description ?? ""));
                                  },
                                  child: const Icon(Icons.edit_calendar),
                                ),
                              ),
                            ],
                          ),
                        );
                      } else if (node.data!.isAssignmentEntity == true) {
                        for (int i = 0;
                            i < node.data!.assignmentEntity!.length;) {
                          return CardWidget<List<AssignmentEntity>>(
                            item: node.data?.assignmentEntity,
                            itemBuilder: (assignmentEntity) => Column(
                              children: [
                                const Text('Assignment'),
                                ListTile(
                                  title: Text(
                                      "Name : ${assignmentEntity?[i].fullName}"),
                                  subtitle: Text(
                                      "Role : ${node.data?.assignmentEntity?[i].role}"),
                                ),
                              ],
                            ),
                          );
                        }
                      } else if (node.data!.isBoardEntity == true) {
                        return CardWidget<BoardEntity>(
                            item: node.data?.boardEntity,
                            itemBuilder: (board) {
                              return ListTile(
                                title: Text("Name : ${board?.name}"),
                                subtitle: Text(
                                    'Descriptioon : ${board?.description}'),
                              );
                            });
                      } else if (node.data!.isMetaDataEntity == true) {
                        return CardWidget<MetadataEntity>(
                            item: node.data!.metadataEntity,
                            itemBuilder: (meta) {
                              return Column(
                                children: [
                                  const Text('Metadata'),
                                  ListTile(
                                    title: Text("${meta?.bg}"),
                                    subtitle: Text('${meta?.font}'),
                                  ),
                                ],
                              );
                            });
                      } else if (node.data!.isPivotEntity == true) {
                        return CardWidget<PivotEntity>(
                            item: node.data!.pivotEntity,
                            itemBuilder: (pivot) {
                              return Column(
                                children: [
                                  const Text('Pivot'),
                                  ListTile(
                                    title: Text("Role : ${pivot?.role}"),
                                    subtitle: Text('ID : ${pivot?.entityId}'),
                                  ),
                                ],
                              );
                            });
                      } else if (node.data!.isChildEntity == true) {
                        for (int i = 0; i < node.data!.childEntity!.length;) {
                          return CardWidget<List<ChildEntity>>(
                              item: node.data?.childEntity,
                              itemBuilder: (child) {
                                return Column(
                                  children: [
                                    const Text('Children'),
                                    ListTile(
                                      title: Text("Title ${child?[i].title}"),
                                      subtitle:
                                          Text('ID ${child?[i].recordStatus}'),
                                    ),
                                  ],
                                );
                              });
                        }
                      }
                      return const SizedBox.shrink();
                    });
              } else if (state is GetTasksFailed) {
                return SliverToBoxAdapter(
                  child: Center(
                    child: CustomTextNunito(
                      text: state.message,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: ColorApp.black,
                    ),
                  ),
                );
              } else if (state is GetTasksEmpty) {
                return SliverFillRemaining(
                  hasScrollBody: false,
                  child: Center(
                    child: CustomTextNunito(
                        text: state.message,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: ColorApp.black),
                  ),
                );
              }
              return SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) => const ShimmerLoading(),
                  childCount: 10, // Number of shimmer placeholders
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
