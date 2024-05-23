import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_list/src/home/presentation/views/detail_pivot_page.dart';
import 'package:todo_list/src/home/presentation/widgets/card_widget.dart';

import '../../../../common/widgets/text_button.dart';
import '../../domain/entities/tasks_entity.dart';
import '../views/detail_board_page.dart';

class CardPivot extends StatelessWidget {
  const CardPivot({super.key, this.pivotEntity});
  final PivotEntity? pivotEntity;

  @override
  Widget build(BuildContext context) {
    return CardWidget<PivotEntity>(
        item: pivotEntity,
        itemBuilder: (pivot) {
          return Column(
            children: [
              const Text('Pivot'),
              ListTile(
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Role : ${pivot?.role}"),
                     Text('ID : ${pivot?.entityId}'),
                     TextButtonWidget(
                        title: "See Detail",
                        onPress: () {
                          context.pushNamed(DetailPivotPage.detailPivotRoute,
                              extra: pivotEntity);
                        })
                     
                    
                  ],
                ),
                
              ),
            ],
          );
        });
  }
}
