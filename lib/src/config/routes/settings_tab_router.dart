import 'package:flutter/material.dart';
import 'package:rick_and_morty_clean_practice/src/config/routes/tab_router.dart';
import 'package:rick_and_morty_clean_practice/src/presentation/pages/settings/settings_page.dart';

class SettingsTabRouter extends TabRouter {
  final GlobalKey<NavigatorState> _key = GlobalKey<NavigatorState>();

  @override
  GlobalKey<NavigatorState> get key => _key;

  @override
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case _SettingsTabRoutes.settings:
        return materialRoute(const SettingsPage());

      default:
        return null;
    }
  }
}

class _SettingsTabRoutes {
  _SettingsTabRoutes._();

  static const String settings = '/';
}
