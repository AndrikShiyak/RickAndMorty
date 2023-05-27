import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class LocationListTile extends HookWidget {
  const LocationListTile({
    super.key,
    required this.keyText,
    required this.valueText,
  });

  final String keyText;
  final String valueText;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        keyText,
        style: Theme.of(context).textTheme.bodyText1!.copyWith(
              fontWeight: FontWeight.bold,
            ),
      ),
      trailing: SizedBox(
        width: 150,
        child: Expanded(
          child: Row(
            children: [
              Expanded(
                child: Text(
                  valueText,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ),
              const Icon(Icons.arrow_forward_ios),
            ],
          ),
        ),
      ),
      onTap: () {},
    );
  }
}
