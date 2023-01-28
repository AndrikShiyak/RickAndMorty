import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class CharactersView extends HookWidget {
  const CharactersView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Characters View',
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
