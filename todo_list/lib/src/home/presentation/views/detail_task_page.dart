import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_list/common/widgets/custom_text.dart';
import 'package:todo_list/core/style/color_app.dart';
import 'package:todo_list/src/home/domain/entities/tasks_entity.dart';

class DetailTaskPage extends StatelessWidget {
  const DetailTaskPage({super.key,this.tasksEntity});
  static const String detailTaskRoute="detail-task-route";
  final TasksEntity? tasksEntity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: CustomTextNunito(text: "Detail Task", fontSize: 20, fontWeight: FontWeight.bold, color: ColorApp.black),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Title : ${tasksEntity?.title}"),
            Text("Description : ${tasksEntity?.description}"),
            Text("Dealine : ${tasksEntity?.deadline}"),
            Text("Proggress : ${tasksEntity?.progress}"),
          ],
        ),
      ),
    );
  }
}
