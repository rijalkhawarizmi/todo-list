import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_list/common/widgets/custom_text.dart';
import 'package:todo_list/core/style/color_app.dart';
import 'package:todo_list/src/home/domain/entities/tasks_entity.dart';
import 'package:todo_list/src/home/presentation/views/detail_board_page.dart';

import '../../../../common/widgets/text_button.dart';
import 'card_widget.dart';

class CardBoard extends StatelessWidget {
  const CardBoard({Key? key, this.boardEntity}) : super(key: key);
  final BoardEntity? boardEntity;

  @override
  Widget build(BuildContext context) {
    return CardWidget<BoardEntity>(
        item: boardEntity,
        itemBuilder: (board) {
          return Column(
            children: [
              const CustomTextNunito(
                  text: "Board",
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: ColorApp.black600),
              ListTile(
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Name : ${board?.name}"),
                     Text('Descriptioon : ${board?.description}'),
                    TextButtonWidget(
                        title: "See Detail",
                        onPress: () {
                          context.pushNamed(DetailBoardPage.detailBoardRoute,
                              extra: board);
                        })
                  ],
                ),

              ),
            ],
          );
        });
  }
}
