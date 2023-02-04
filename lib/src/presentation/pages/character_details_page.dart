import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:rick_and_morty_clean_practice/src/injector.dart';
import 'package:rick_and_morty_clean_practice/src/presentation/blocs/remote_character_details/remote_character_details_bloc.dart';
import 'state_page.dart';

class CharacterDetailsPage extends StatelessWidget {
  const CharacterDetailsPage({
    super.key,
    required this.characterId,
  });

  final int characterId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RemoteCharacterDetailsBloc>(
      create: (context) => injector()..add(GetCharacter(characterId)),
      child: const CharacterDetailsView(),
    );
  }
}

class CharacterDetailsView extends HookWidget {
  const CharacterDetailsView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // useEffect(() {
    //   context.read<RemoteCharactersListBloc>().add(GetCharacter(characterId));

    //   print('tratata tratata');
    //   return () {};
    // }, []);

    return BlocBuilder<RemoteCharacterDetailsBloc, RemoteCharacterDetailsState>(
      builder: (_, state) {
        return StatePage(
          state: state.status,
          child: Scaffold(
            appBar: AppBar(
              title: Text(state.character?.name ?? ''),
            ),
            body: Column(
              children: [
                Image.network(state.character?.image ?? ''),
                Expanded(
                  child: Column(
                    children: [
                      Row(
                        children: const [
                          Text('key'),
                          Text('value'),
                        ],
                      ),
                      Row(
                        children: const [
                          Text('key'),
                          Text('value'),
                        ],
                      ),
                      Row(
                        children: const [
                          Text('key'),
                          Text('value'),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
