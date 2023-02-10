import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class CardCenter extends HookWidget {
  const CardCenter({
    super.key,
    required this.top,
    required this.center,
    required this.bottom,
  });

  final String top;
  final String center;
  final Widget bottom;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          top,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 10),
        Text(center),
        const SizedBox(height: 10),
        bottom,
      ],
    );
  }
}
