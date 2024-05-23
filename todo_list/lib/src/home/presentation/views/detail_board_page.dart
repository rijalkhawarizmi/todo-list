import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_list/src/home/domain/entities/tasks_entity.dart';

import '../../../../common/widgets/custom_text.dart';
import '../../../../core/style/color_app.dart';

class DetailBoardPage extends StatelessWidget {
  const DetailBoardPage({super.key, this.tasksEntity});
  static const String detailBoardRoute = "detail-board-route";
  final BoardEntity? tasksEntity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomTextNunito(
            text: "Detail Board",
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: ColorApp.black),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Name : ${tasksEntity?.name}"),
            Text("Description : ${tasksEntity?.description}"),
            Text("Role :  ${tasksEntity?.code}"),
          ],
        ),
      ),
    );
  }
}
