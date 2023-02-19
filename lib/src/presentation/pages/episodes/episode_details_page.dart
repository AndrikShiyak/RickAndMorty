import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:rick_and_morty_clean_practice/src/domain/entities/episode.dart';
import 'package:rick_and_morty_clean_practice/src/injector.dart';
import 'package:rick_and_morty_clean_practice/src/presentation/pages/state_page.dart';
import '../../blocs/remote_episode_details/remote_episode_details_bloc.dart';

class EpisodeDetailsPage extends HookWidget {
  const EpisodeDetailsPage({
    super.key,
    required this.episodeId,
  });

  final int episodeId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RemoteEpisodeDetailsBloc>(
      create: (context) => injector()..add(GetEpisode(episodeId)),
      child: const EpisodeDetailsView(),
    );
  }
}

class EpisodeDetailsView extends HookWidget {
  const EpisodeDetailsView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RemoteEpisodeDetailsBloc, RemoteEpisodeDetailsState>(
      builder: (_, state) {
        final Episode? episode = state.episode;

        return StatePage(
          state: state.status,
          child: Scaffold(
            appBar: AppBar(
              title: Text(episode?.name ?? ''),
            ),
            body: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(episode?.name ?? ''),
                  const SizedBox(height: 10),
                  Text(episode?.episode ?? ''),
                  const SizedBox(height: 10),
                  Text(episode?.airDate ?? ''),
                  const SizedBox(height: 10),
                  ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) =>
                        Text(episode?.characters?[index] ?? ''),
                    separatorBuilder: (context, index) => const Divider(),
                    itemCount: episode?.characters?.length ?? 0,
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
