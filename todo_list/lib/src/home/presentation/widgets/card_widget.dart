import 'package:flutter/material.dart';

class CardWidget<T> extends StatelessWidget {
  final T? item; 
  final Widget Function(T?) itemBuilder;

  const CardWidget({super.key, required this.item, required this.itemBuilder});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: itemBuilder(item),
      ),
    );
  }
}
