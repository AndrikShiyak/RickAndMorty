import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class KeyValueWidget extends HookWidget {
  const KeyValueWidget({
    super.key,
    required this.keyText,
    required this.valueText,
  });

  final String keyText;
  final String? valueText;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          keyText,
          style: Theme.of(context).textTheme.headline6,
        ),
        const SizedBox(width: 10),
        if (valueText != null)
          Expanded(
            child: Text(
              valueText!,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
      ],
    );
  }
}
