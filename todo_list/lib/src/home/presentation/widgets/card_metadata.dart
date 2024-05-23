import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_list/src/home/presentation/views/detail_metada_page.dart';

import '../../../../common/widgets/custom_text.dart';
import '../../../../core/style/color_app.dart';
import '../../domain/entities/tasks_entity.dart';
import '../views/detail_task_page.dart';
import 'card_widget.dart';

class CardMetaData extends StatelessWidget {
  const CardMetaData({super.key, this.metadataEntity});
  final MetadataEntity? metadataEntity;

  @override
  Widget build(BuildContext context) {
    return CardWidget<MetadataEntity>(
        item: metadataEntity,
        itemBuilder: (meta) {
          return Column(
            children: [
              const Text('Metadata'),
              ListTile(
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("${meta?.bg}"),
                    TextButton(
                    onPressed: () {
                      context.pushNamed(DetailMetaDataPage.detailMetaDataRoute,extra: metadataEntity);
                    },
                    child: const CustomTextNunito(
                        text: "See Detail",
                        fontSize: 15,
                        fontWeight: FontWeight.w800,
                        color: ColorApp.blue))
                  ],
                ),
                subtitle: Text('${meta?.font}'),
              ),
            ],
          );
        });
  }
}
