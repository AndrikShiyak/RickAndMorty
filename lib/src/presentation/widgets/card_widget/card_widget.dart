import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class CardWidget extends HookWidget {
  const CardWidget({
    super.key,
    required this.onTap,
    required this.child,
  });

  final VoidCallback onTap;

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: onTap,
        child: SizedBox(
          height: 100,
          width: double.infinity,
          child: child,
        ),
      ),
    );
  }
}
