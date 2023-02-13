import 'package:flutter/material.dart';
import 'package:rick_and_morty_clean_practice/src/config/routes/tab_router.dart';
import '../../presentation/pages/episodes/episode_details_page.dart';
import '../../presentation/pages/episodes/episodes_list_page.dart';
import 'app_routes.dart';

class EpisodesTabRouter extends TabRouter {
  final GlobalKey<NavigatorState> _key = GlobalKey<NavigatorState>();

  @override
  GlobalKey<NavigatorState> get key => _key;

  @override
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.root:
        return materialRoute(const EpisodesListPage());

      case AppRoutes.episodeDetails:
        return materialRoute(EpisodeDetailsPage(
          episodeId: settings.arguments as int,
        ));

      default:
        return null;
    }
  }
}
