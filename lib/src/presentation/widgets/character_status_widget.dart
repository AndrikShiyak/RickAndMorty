import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class CharacterStatusWidget extends HookWidget {
  const CharacterStatusWidget({
    Key? key,
    required this.status,
  }) : super(key: key);

  final String status;

  Color get _color {
    switch (status) {
      case 'Alive':
        return Colors.green;
      case 'Dead':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 5,
      backgroundColor: _color,
    );
  }
}
