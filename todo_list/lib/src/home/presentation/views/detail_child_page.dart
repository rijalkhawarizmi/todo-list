import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_list/src/home/domain/entities/tasks_entity.dart';

import '../../../../common/widgets/custom_text.dart';
import '../../../../core/style/color_app.dart';

class DetailChildPage extends StatelessWidget {
  const DetailChildPage({super.key, this.childEntity});
  static const String detailChildRoute = "detail-child-route";
  final ChildEntity? childEntity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(title: CustomTextNunito(text: "Detail Child", fontSize: 20, fontWeight: FontWeight.bold, color: ColorApp.black),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Title : ${childEntity?.title}"),
            Text("Created By : ${childEntity?.createdBy}"),
            Text("Created At : ${childEntity?.createdAt}"),
          ],
        ),
      ),
    );
  }
}
