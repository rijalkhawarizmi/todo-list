

import 'package:flutter/material.dart';

class AlertWidget extends StatelessWidget {
  final Widget? title;
  final Widget? content;
  final List<Widget>? actions;

  AlertWidget({
    this.title,
    this.content,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: title,
      content: content,
      actions: actions,
    );
  }
}
