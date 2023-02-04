import 'package:flutter/material.dart';
import 'package:rick_and_morty_clean_practice/src/presentation/pages/character_details_page.dart';
import '../../presentation/pages/characters_list_page.dart';

class AppRouter {
  static Route? onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.characters:
        return _materialRoute(const CharactersListPage());
      case AppRoutes.characterDetails:
        return _materialRoute(CharacterDetailsPage(
          characterId: settings.arguments as int,
        ));

      default:
    }
  }

  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }
}

class AppRoutes {
  AppRoutes._();

  static const String characters = '/';
  static const String characterDetails = '/character_details';
}
