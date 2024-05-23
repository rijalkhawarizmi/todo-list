import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_list/src/home/presentation/views/detail_child_page.dart';

import '../../../../common/widgets/text_button.dart';
import '../../domain/entities/tasks_entity.dart';
import 'card_widget.dart';

class CardChild extends StatelessWidget {
  const CardChild({super.key, this.childEntity});
  final ChildEntity? childEntity;

  @override
  Widget build(BuildContext context) {
    return CardWidget<ChildEntity>(
        item: childEntity,
        itemBuilder: (child) {
          return Column(
            children: [
              const Text('Children'),
              ListTile(
                title: Column(
                  children: [
                    Text("Title ${child?.title}"),
                    TextButtonWidget(
                        title: "See Detail",
                        onPress: () {
                          context.pushNamed(DetailChildPage.detailChildRoute,
                              extra: childEntity);
                        })
                  ],
                ),
                subtitle: Text('ID ${child?.recordStatus}'),
              ),
            ],
          );
        });
  }
}
