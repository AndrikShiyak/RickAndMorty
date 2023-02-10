import 'package:flutter/material.dart';
import 'package:rick_and_morty_clean_practice/src/config/routes/tab_router.dart';

import '../../presentation/pages/episodes/episode_details_page.dart';
import '../../presentation/pages/episodes/episodes_list_page.dart';

class EpisodesTabRouter extends TabRouter {
  final GlobalKey<NavigatorState> _key = GlobalKey<NavigatorState>();

  @override
  GlobalKey<NavigatorState> get key => _key;

  @override
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case _EpisodesTabRoutes.episodes:
        return materialRoute(const EpisodesListPage());

      case _EpisodesTabRoutes.episodeDetails:
        return materialRoute(EpisodeDetailsPage(
          characterId: settings.arguments as int,
        ));

      default:
        return null;
    }
  }
}

class _EpisodesTabRoutes {
  _EpisodesTabRoutes._();

  static const String episodes = '/';
  static const String episodeDetails = '/episode_details';
}
