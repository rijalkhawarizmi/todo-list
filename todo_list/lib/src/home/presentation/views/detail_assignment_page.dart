import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_list/src/home/domain/entities/tasks_entity.dart';

import '../../../../common/widgets/custom_text.dart';
import '../../../../core/style/color_app.dart';

class DetailAssignmentPage extends StatelessWidget {
  const DetailAssignmentPage({super.key, this.assignmentEntity});
  static const String detailAssignmentRoute = "detail-assignment-route";
  final AssignmentEntity? assignmentEntity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(title: const CustomTextNunito(text: "Detail Assisgnment", fontSize: 20, fontWeight: FontWeight.bold, color: ColorApp.black),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Name : ${assignmentEntity?.fullName}"),
            Text("Company : ${assignmentEntity?.company}"),
            Text("Role : ${assignmentEntity?.role}"),
          ],
        ),
      ),
    );
  }
}
