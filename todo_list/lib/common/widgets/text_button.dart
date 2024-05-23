import 'package:flutter/material.dart';
import 'package:todo_list/common/widgets/custom_text.dart';

import '../../core/style/color_app.dart';

class TextButtonWidget extends StatelessWidget {
  TextButtonWidget({super.key,required this.title,required this.onPress});
  String title;
  Function() onPress;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPress,
        child: CustomTextNunito(
            text: title,
            fontSize: 17,
            fontWeight: FontWeight.w500,
            color: ColorApp.black));
  }
}
