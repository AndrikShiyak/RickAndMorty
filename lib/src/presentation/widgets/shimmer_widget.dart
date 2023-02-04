import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerWidget extends HookWidget {
  const ShimmerWidget({
    super.key,
    required this.height,
    required this.width,
  });

  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Shimmer.fromColors(
        baseColor: const Color.fromARGB(255, 208, 208, 208),
        highlightColor: const Color.fromARGB(255, 227, 227, 227),
        child: Container(
          height: height,
          width: width,
          color: Colors.white,
        ),
      ),
    );
  }
}
