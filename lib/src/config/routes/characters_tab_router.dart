import 'package:flutter/material.dart';
import 'package:rick_and_morty_clean_practice/src/config/routes/tab_router.dart';

import '../../presentation/pages/characters/character_details_page.dart';
import '../../presentation/pages/characters/characters_list_page.dart';

class CharactersTabRouter extends TabRouter {
  final GlobalKey<NavigatorState> _key = GlobalKey<NavigatorState>();

  @override
  GlobalKey<NavigatorState> get key => _key;

  @override
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case _CharactersTabRoutes.characters:
        return materialRoute(const CharactersListPage());

      case _CharactersTabRoutes.characterDetails:
        return materialRoute(CharacterDetailsPage(
          characterId: settings.arguments as int,
        ));

      default:
        return null;
    }
  }
}

class _CharactersTabRoutes {
  _CharactersTabRoutes._();

  static const String characters = '/';
  static const String characterDetails = '/character_details';
}
