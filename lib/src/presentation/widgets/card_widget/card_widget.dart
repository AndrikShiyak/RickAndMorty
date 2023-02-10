import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class CardWidget extends HookWidget {
  const CardWidget({
    super.key,
    required this.onTap,
    this.left,
    required this.center,
    this.indentation,
  });

  final VoidCallback onTap;

  final Widget? left;
  final Widget center;

  final double? indentation;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: onTap,
        child: SizedBox(
          height: 100,
          width: double.infinity,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              left ?? const SizedBox(),
              SizedBox(width: indentation),
              Expanded(child: center),
            ],
          ),
        ),
      ),
    );
  }
}
