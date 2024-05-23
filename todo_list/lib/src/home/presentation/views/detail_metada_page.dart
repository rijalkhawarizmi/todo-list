import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_list/src/home/domain/entities/tasks_entity.dart';

import '../../../../common/widgets/custom_text.dart';
import '../../../../core/style/color_app.dart';

class DetailMetaDataPage extends StatelessWidget {
  const DetailMetaDataPage({super.key, this.metadataEntity});
  static const String detailMetaDataRoute = "detail-metadata-route";
  final MetadataEntity? metadataEntity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(title: const CustomTextNunito(text: "Detail Meta Data", fontSize: 20, fontWeight: FontWeight.bold, color: ColorApp.black),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("BG : ${metadataEntity?.bg}"),
            Text("FONT : ${metadataEntity?.font}"),
          ],
        ),
      ),
    );
  }
}
