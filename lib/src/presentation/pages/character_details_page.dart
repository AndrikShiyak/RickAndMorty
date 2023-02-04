import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:rick_and_morty_clean_practice/src/injector.dart';
import 'package:rick_and_morty_clean_practice/src/presentation/blocs/remote_character_details/remote_character_details_bloc.dart';
import '../../domain/entities/character.dart';
import '../widgets/key_value_widget.dart';
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
    return BlocBuilder<RemoteCharacterDetailsBloc, RemoteCharacterDetailsState>(
      builder: (_, state) {
        final Character? character = state.character;

        return StatePage(
          state: state.status,
          child: Scaffold(
            appBar: AppBar(
              title: Text(character?.name ?? ''),
            ),
            body: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                children: [
                  Image.network(
                    character?.image ?? '',
                    fit: BoxFit.fitWidth,
                    width: double.infinity,
                  ),
                  const SizedBox(height: 20),
                  if (character != null)
                    Column(
                      children: [
                        KeyValueWidget(
                          keyText: 'Name: ',
                          valueText: character.name,
                        ),
                        const SizedBox(height: 10),
                        KeyValueWidget(
                          keyText: 'Species: ',
                          valueText: character.species,
                        ),
                        const SizedBox(height: 10),
                        KeyValueWidget(
                          keyText: 'Gender: ',
                          valueText: character.gender,
                        ),
                        const SizedBox(height: 10),
                        KeyValueWidget(
                          keyText: 'Status: ',
                          valueText: character.status,
                        ),
                        const SizedBox(height: 10),
                        KeyValueWidget(
                          keyText: 'Type: ',
                          valueText: character.type,
                        ),
                        const SizedBox(height: 10),
                        KeyValueWidget(
                          keyText: 'Origin: ',
                          valueText: character.origin.name,
                        ),
                        const SizedBox(height: 10),
                        KeyValueWidget(
                          keyText: 'Location: ',
                          valueText: character.location.name,
                        ),
                        const SizedBox(height: 10),
                        ListView(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          children: [
                            Text(
                              'Episodes:',
                              style: Theme.of(context).textTheme.headline6,
                            ),
                            const SizedBox(height: 10),
                            for (var episode in character.episode)
                              Padding(
                                padding: const EdgeInsets.only(bottom: 5),
                                child: Text(episode),
                              ),
                          ],
                        ),
                      ],
                    ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
