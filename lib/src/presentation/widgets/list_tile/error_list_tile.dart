import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class ErrorListTile extends HookWidget {
  const ErrorListTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Icon(
        Icons.error,
        color: Theme.of(context).errorColor,
      ),
    );
  }
}
