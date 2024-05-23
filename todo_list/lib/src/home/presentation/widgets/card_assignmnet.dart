import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_list/common/widgets/text_button.dart';
import 'package:todo_list/src/home/presentation/views/detail_assignment_page.dart';

import '../../domain/entities/tasks_entity.dart';
import 'card_widget.dart';

class CardAssignment extends StatelessWidget {
  CardAssignment({Key? key, this.assignmentEntity}) : super(key: key);
  final AssignmentEntity? assignmentEntity;

  @override
  Widget build(BuildContext context) {
    return CardWidget<AssignmentEntity>(
      item: assignmentEntity,
      itemBuilder: (assignmentEntity) => Column(
        children: [
          const Text('Assignment'),
          ListTile(
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Name : ${assignmentEntity?.fullName}"),
                Text("Role : ${assignmentEntity?.role}"),
                TextButtonWidget(
                    title: "See Detail",
                    onPress: () {
                      context.pushNamed(
                          DetailAssignmentPage.detailAssignmentRoute,
                          extra: assignmentEntity);
                    })
              ],
            ),
          ),
        ],
      ),
    );
  }
}
