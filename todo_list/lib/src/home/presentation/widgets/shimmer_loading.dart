import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerLoading extends StatelessWidget {
  const ShimmerLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90.0,
      child: Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          period: const Duration(milliseconds: 800),
          child: const Card(
            margin: EdgeInsets.all(10),
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: ListTile(),
            ),
          )),
    );
  }
}
