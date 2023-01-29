import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../blocs/remote_characters/bloc/remote_characters_bloc.dart';

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
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            BlocProvider.of<RemoteCharactersBloc>(context)
                .add(const GetCharacters());
          },
          child: const Text('Get Characters'),
        ),
      ),
    );
  }
}
