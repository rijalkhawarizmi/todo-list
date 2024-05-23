import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_list/src/home/domain/entities/tasks_entity.dart';

import '../../../../common/widgets/custom_text.dart';
import '../../../../core/style/color_app.dart';

class DetailPivotPage extends StatelessWidget {
  const DetailPivotPage({super.key, this.pivotEntity});
  static const String detailPivotRoute = "detail-pivot-route";
  final PivotEntity? pivotEntity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(title: CustomTextNunito(text: "Detail Pivot", fontSize: 20, fontWeight: FontWeight.bold, color: ColorApp.black),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Role : ${pivotEntity?.role}"),
            Text("Type : ${pivotEntity?.pivotableType}"),
            Text("ID : ${pivotEntity?.entityId}"),
          ],
        ),
      ),
    );
  }
}
