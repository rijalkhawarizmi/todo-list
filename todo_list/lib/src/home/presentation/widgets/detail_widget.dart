
import 'package:flutter/material.dart';

class DetailWidget<T> extends StatelessWidget {
  final T data;
  final Widget Function(T) builder;

  const DetailWidget({
    required this.data,
    required this.builder,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Generic Page Example'),
      ),
      body: builder(data),
    );
  }
}
