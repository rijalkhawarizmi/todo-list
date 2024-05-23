import 'package:flutter/material.dart';
import 'package:todo_list/common/widgets/custom_text.dart';

import '../../core/style/color_app.dart';

class TextButtonWidget extends StatelessWidget {
  TextButtonWidget({super.key,required this.title,required this.onPress});
  final String title;
  final Function() onPress;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPress,
        child: CustomTextNunito(
            text: title,
            fontSize: 17,
            fontWeight: FontWeight.bold,
            color: ColorApp.blue));
  }
}
