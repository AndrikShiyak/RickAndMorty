import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:rick_and_morty_clean_practice/src/injector.dart';
import 'package:rick_and_morty_clean_practice/src/presentation/blocs/remote_character_details/remote_character_details_bloc.dart';
import 'package:rick_and_morty_clean_practice/src/presentation/pages/state_page.dart';

import '../../../domain/entities/character.dart';
import '../../widgets/cached_network_image_widget.dart';
import '../../widgets/key_value_widget.dart';

class LocationDetailsPage extends HookWidget {
  const LocationDetailsPage({
    super.key,
    required this.characterId,
  });

  final int characterId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RemoteCharacterDetailsBloc>(
      create: (context) => injector(),
      child: const LocationDetailsView(),
    );
  }
}

class LocationDetailsView extends HookWidget {
  const LocationDetailsView({
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
                  CachedNetworkImageWidget(
                    imageUrl: character?.image ?? '',
                    height: 330,
                  ),
                  const SizedBox(height: 20),
                  Column(
                    children: [
                      for (var info
                          in character?.infoMap.entries.toList() ?? []) ...[
                        KeyValueWidget(
                          keyText: info.key,
                          valueText: info.value,
                        ),
                        const SizedBox(height: 10),
                      ],
                      ListView(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        children: [
                          Text(
                            'Episodes:',
                            style: Theme.of(context).textTheme.headline6,
                          ),
                          const SizedBox(height: 10),
                          for (var episode in character?.episode ?? [])
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
