import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_list/src/home/presentation/views/detail_task_page.dart';
import 'package:todo_list/src/home/presentation/widgets/card_widget.dart';

import '../../../../common/widgets/alert_widget.dart';
import '../../../../common/widgets/custom_text.dart';
import '../../../../common/widgets/text_button.dart';
import '../../../../core/style/color_app.dart';
import '../../domain/entities/tasks_entity.dart';
import '../../domain/usecases/update_tasks.dart';
import '../cubit/delete_tasks/delete_tasks_cubit.dart';
import '../cubit/get_tasks/get_tasks_cubit.dart';
import '../views/add_update_tasks_page.dart';

class TasksCard extends StatelessWidget {
  const TasksCard({Key? key, this.tasksEntity}) : super(key: key);
  final TasksEntity? tasksEntity;

  @override
  Widget build(BuildContext context) {
    return CardWidget<TasksEntity>(
      item: tasksEntity,
      itemBuilder: (tasks) => Column(
        children: [
          ListTile(
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("${tasks?.title}"),
                TextButton(
                    onPressed: () {
                      context.pushNamed(DetailTaskPage.detailTaskRoute,extra: tasksEntity);
                    },
                    child: const CustomTextNunito(
                        text: "See Detail",
                        fontSize: 15,
                        fontWeight: FontWeight.w800,
                        color: ColorApp.blue))
              ],
            ),
            visualDensity: const VisualDensity(vertical: 4),
            trailing: Column(
              children: [
                BlocConsumer<DeleteTasksCubit, DeleteTasksState>(
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
                      context.read<GetTasksCubit>().getListTasks();
                      context.pop();
                      Fluttertoast.showToast(
                          msg: state.message,
                          backgroundColor: Colors.green.shade500);
                    } else if (state is DeleteTasksFailed) {
                      context.pop();
                      Fluttertoast.showToast(
                          msg: state.message, backgroundColor: ColorApp.red);
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
                                      textAlign: TextAlign.center,
                                      text:
                                          "Anda yakin ingin menghapus tasks ini ?",
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
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
                                              .read<DeleteTasksCubit>()
                                              .deleteTasks(tasks!.id!);
                                          context.pop();
                                        })
                                  ],
                                );
                              });
                        },
                        icon: const Icon(Icons.delete));
                  },
                ),
                InkWell(
                  onTap: () {
                    context.pushNamed(AddUpdateTasksPage.addTasksRoute,
                        extra: UpdateTasksParams(
                            id: tasks!.id!,
                            title: tasks.title ?? "",
                            description: tasks.description ?? ""));
                  },
                  child: const Icon(Icons.edit_calendar),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
