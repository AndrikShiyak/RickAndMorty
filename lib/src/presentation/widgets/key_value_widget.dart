import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:rick_and_morty_clean_practice/src/presentation/widgets/shimmer_widget.dart';

class KeyValueWidget extends HookWidget {
  const KeyValueWidget({
    super.key,
    this.keyText,
    this.valueText,
  });

  final String? keyText;
  final String? valueText;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (keyText == null)
          const ShimmerWidget(
            height: 24,
            width: 80,
          )
        else
          Text(
            keyText!,
            style: Theme.of(context).textTheme.headline6,
          ),
        const SizedBox(width: 10),
        if (valueText == null)
          const ShimmerWidget(
            height: 24,
            width: 220,
          )
        else
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
