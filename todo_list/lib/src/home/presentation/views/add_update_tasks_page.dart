import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_list/src/home/domain/usecases/add_tasks.dart';
import 'package:todo_list/src/home/domain/usecases/update_tasks.dart';
import 'package:todo_list/src/home/presentation/cubit/add_tasks/add_tasks_cubit.dart';
import 'package:todo_list/src/home/presentation/cubit/get_tasks/get_tasks_cubit.dart';
import 'package:todo_list/src/home/presentation/cubit/update_tasks/update_tasks_cubit.dart';
import 'package:todo_list/src/home/presentation/views/home_page.dart';
import '../../../../common/widgets/button.dart';
import '../../../../common/widgets/custom_text.dart';
import '../../../../common/widgets/text_field.dart';
import '../../../../core/style/color_app.dart';
import '../../../authentication/presentation/widget/toast_widget.dart';

class AddUpdateTasksPage extends StatelessWidget {
  static const String addTasksRoute = 'addupdatetasks-route';
  AddUpdateTasksPage({super.key, this.updateTasksParams});
  UpdateTasksParams? updateTasksParams;

  late TextEditingController title;
  late TextEditingController description;

  @override
  Widget build(BuildContext context) {
    title = TextEditingController(text: updateTasksParams?.title);
    description = TextEditingController(text: updateTasksParams?.description);
    return Scaffold(
        appBar: AppBar(
          title: CustomTextNunito(
              text: updateTasksParams != null ? "Update" : "Add",
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: ColorApp.black600),
          elevation: 1,
        ),
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextRobotoField(
                    controller: title,
                    hintText: 'Title',
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: CustomTextRobotoField(
                      controller: description,
                      hintText: 'Description',
                    ),
                  ),
                ],
              ),
              updateTasksParams != null
                  ? BlocConsumer<UpdateTasksCubit, UpdateTasksState>(
                      listener: (context, state) {
                        if (state is UpdateTasksSuccess) {
                          context.read<GetTasksCubit>().getListTasks();
                          Fluttertoast.showToast(
                              msg: state.message,
                              backgroundColor: Colors.green.shade400);
                          context.pop();
                        } else if (state is UpdateTasksFailed) {
                          toastWidget(state.message);
                        }
                        // TODO: implement listener
                      },
                      builder: (context, state) {
                        return CustomButton(
                          onPressed: () {
                            if (title.text.isEmpty) {
                              toastWidget('Masukkan title');
                            } else if (description.text.isEmpty) {
                              toastWidget('Masukkan description');
                            } else {
                              context.read<UpdateTasksCubit>().updateTasks(
                                  UpdateTasksParams(
                                      id: updateTasksParams!.id,
                                      title: title.text,
                                      description: description.text));
                            }
                          },
                          borderRadius: 4,
                          isLoading: state is UpdateTasksLoading ? true : false,
                          text: 'UPDATE',
                        );
                      },
                    )
                  : BlocConsumer<AddTasksCubit, AddTasksState>(
                      listener: (context, state) {
                        if (state is AddTasksSuccess) {
                          context.read<GetTasksCubit>().getListTasks();
                          Fluttertoast.showToast(
                              msg: "Success Add New Task",
                              backgroundColor: Colors.green.shade400);
                          context.pop();
                        } else if (state is AddTasksFailed) {
                          toastWidget(state.message);
                        }
                        // TODO: implement listener
                      },
                      builder: (context, state) {
                        return CustomButton(
                          onPressed: () {
                            if (title.text.isEmpty) {
                              toastWidget('Masukkan title');
                            } else if (description.text.isEmpty) {
                              toastWidget('Masukkan description');
                            } else {
                              context.read<AddTasksCubit>().addTask(
                                  AddTasksParam(
                                      title: title.text,
                                      description: description.text));
                            }
                          },
                          borderRadius: 4,
                          isLoading: state is AddTasksLoading ? true : false,
                          text: 'ADD',
                        );
                      },
                    ),
            ],
          ),
        ));
  }
}
