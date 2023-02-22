import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:rick_and_morty_clean_practice/src/injector.dart';
import 'package:rick_and_morty_clean_practice/src/presentation/blocs/remote_character_details/remote_character_details_bloc.dart';
import '../../../core/enums/view_state.dart';
import '../../../domain/entities/character.dart';
import '../../widgets/cached_network_image_widget.dart';
import '../../widgets/character_status_widget.dart';
import '../../widgets/key_value_widget.dart';
import '../../widgets/list_tile/episode_list_tile.dart';
import '../../widgets/list_tile/error_list_tile.dart';

class CharacterDetailsPage extends HookWidget {
  const CharacterDetailsPage({
    super.key,
    required this.character,
  });

  final Character character;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RemoteCharacterDetailsBloc>(
      create: (context) => RemoteCharacterDetailsBloc(injector(), character)
        ..add(const LoadEpisodes()),
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
        final Character character = state.character;

        return Scaffold(
          appBar: AppBar(
            title: Text(character.name),
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              children: [
                CachedNetworkImageWidget(
                  imageUrl: character.image,
                  height: 330,
                ),
                const SizedBox(height: 20),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CharacterStatusWidget(
                          status: character.status,
                        ),
                        const SizedBox(width: 10),
                        Text(
                          character.status,
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                      ],
                    ),
                    KeyValueWidget(
                      keyText: 'Species:',
                      valueText: character.species,
                    ),
                    KeyValueWidget(
                      keyText: 'Gender:',
                      valueText: character.gender,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Locations',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Episodes',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    const SizedBox(height: 10),
                    ListView(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      children: [
                        if (state.status == ViewState.loading)
                          const Center(
                            child: CircularProgressIndicator(),
                          )
                        else if (state.status == ViewState.success)
                          ListView.separated(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              final episode = character.getEpisodes[index];

                              if (episode != null) {
                                return EpisodeListTile(
                                  episode: episode,
                                );
                              }

                              return const ErrorListTile();
                            },
                            separatorBuilder: (context, index) {
                              return const Divider(
                                height: 1,
                              );
                            },
                            itemCount: character.getEpisodes.length,
                          ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
