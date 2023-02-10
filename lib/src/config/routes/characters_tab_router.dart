import 'package:flutter/material.dart';
import 'package:rick_and_morty_clean_practice/src/config/routes/tab_router.dart';
import '../../presentation/pages/characters/character_details_page.dart';
import '../../presentation/pages/characters/characters_list_page.dart';
import 'app_routes.dart';

class CharactersTabRouter extends TabRouter {
  final GlobalKey<NavigatorState> _key = GlobalKey<NavigatorState>();

  @override
  GlobalKey<NavigatorState> get key => _key;

  @override
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.root:
        return materialRoute(const CharactersListPage());

      case AppRoutes.characterDetails:
        return materialRoute(CharacterDetailsPage(
          characterId: settings.arguments as int,
        ));

      default:
        return null;
    }
  }
}
