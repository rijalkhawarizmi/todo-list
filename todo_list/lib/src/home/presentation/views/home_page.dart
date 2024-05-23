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
import 'package:todo_list/src/home/presentation/views/add_update_tasks_page.dart';
import 'package:todo_list/src/home/presentation/widgets/card_metadata.dart';
import 'package:todo_list/src/home/presentation/widgets/shimmer_loading.dart';
import 'package:todo_list/src/home/presentation/widgets/task_card.dart';
import '../../../../core/style/color_app.dart';
import '../cubit/get_tasks/get_tasks_cubit.dart';
import '../widgets/card_assignmnet.dart';
import '../widgets/card_board.dart';
import '../widgets/card_child.dart';
import '../widgets/card_pivot.dart'; // Update this to your actual import

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
             textAlign: TextAlign.center,
            text: "ADD TASK",
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: ColorApp.black),
      ),
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                context.goNamed(LoginPage.loginRoute);
                SharedStorage.removeAuth();
              },
              icon: const Icon(Icons.logout))
        ],
      ),
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
                        return TasksCard(tasksEntity: node.data?.tasksEntity);
                      } else if (node.data!.isAssignmentEntity == true) {
                        for (int i = 0;
                            i < node.data!.assignmentEntity!.length;) {
                          return CardAssignment(
                              assignmentEntity:
                                  node.data?.assignmentEntity?[i]);
                        }
                      } else if (node.data!.isBoardEntity == true) {
                        return CardBoard(
                          boardEntity: node.data?.boardEntity,
                        );
                      } else if (node.data!.isMetaDataEntity == true) {
                        return CardMetaData(
                          metadataEntity: node.data?.metadataEntity,
                        );
                      } else if (node.data!.isPivotEntity == true) {
                        return CardPivot(
                          pivotEntity: node.data?.pivotEntity,
                        );
                      } else if (node.data!.isChildEntity == true) {
                        for (int i = 0; i < node.data!.childEntity!.length;) {
                          return CardChild(
                              childEntity: node.data?.childEntity?[i]);
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
