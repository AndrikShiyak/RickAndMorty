import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:rick_and_morty_clean_practice/src/config/routes/app_routes.dart';
import 'package:rick_and_morty_clean_practice/src/domain/entities/episode.dart';
import 'package:rick_and_morty_clean_practice/src/presentation/widgets/card_widget/card_widget.dart';
import 'card_center.dart';

class EpisodeCard extends HookWidget {
  const EpisodeCard({
    super.key,
    required this.episode,
  });

  final Episode episode;

  @override
  Widget build(BuildContext context) {
    return CardWidget(
      onTap: () => Navigator.of(context)
          .pushNamed(AppRoutes.characterDetails, arguments: episode.id),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: CardCenter(
          top: episode.name!,
          center: episode.episode!,
          bottom: Text(episode.airDate ?? ''),
        ),
      ),
    );
  }
}
