import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:rick_and_morty_clean_practice/src/injector.dart';
import 'package:rick_and_morty_clean_practice/src/presentation/blocs/remote_character_details/remote_character_details_bloc.dart';
import '../../../core/enums/view_state.dart';
import '../../../domain/entities/character.dart';
import '../../../domain/entities/episode.dart';
import '../../widgets/cached_network_image_widget.dart';
import '../../widgets/key_value_widget.dart';

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

        // return StatePage(
        //   state: state.status,
        //   child:
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    for (var info in character.infoMap.entries.toList()) ...[
                      KeyValueWidget(
                        keyText: info.key,
                        valueText: info.value,
                      ),
                      const SizedBox(height: 10),
                    ],
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
                          for (Episode? episode in character.getEpisodes)
                            // Text(episode.name ?? ''),

                            if (episode != null)
                              Container(
                                color: Colors.yellow,
                                child: ListTile(
                                  contentPadding: EdgeInsets.zero,
                                  minVerticalPadding: 0,
                                  title: Text(episode.name ?? ''),
                                  trailing: Icon(Icons.arrow_forward_ios),
                                  onTap: () {
                                    print('sadasda ${episode.id}');
                                  },
                                ),
                              )
                            else
                              Container(
                                color: Colors.red,
                                child: ListTile(
                                  contentPadding: EdgeInsets.zero,
                                  minVerticalPadding: 0,
                                  title: Text(episode?.name ?? ''),
                                  trailing: Icon(Icons.arrow_forward_ios),
                                  onTap: () {
                                    print('sadasda ${episode?.id}');
                                  },
                                ),
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
