import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:rick_and_morty_clean_practice/src/domain/entities/episode.dart';

class EpisodeListTile extends HookWidget {
  const EpisodeListTile({
    super.key,
    required this.episode,
  });

  final Episode episode;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(episode.name ?? ''),
      trailing: const Icon(Icons.arrow_forward_ios),
      onTap: () {
        print('sadasda ${episode.id}');
      },
    );
  }
}
