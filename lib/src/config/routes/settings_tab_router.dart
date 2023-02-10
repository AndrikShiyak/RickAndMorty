import 'package:flutter/material.dart';
import 'package:rick_and_morty_clean_practice/src/config/routes/tab_router.dart';
import 'package:rick_and_morty_clean_practice/src/presentation/pages/settings/settings_page.dart';
import 'app_routes.dart';

class SettingsTabRouter extends TabRouter {
  final GlobalKey<NavigatorState> _key = GlobalKey<NavigatorState>();

  @override
  GlobalKey<NavigatorState> get key => _key;

  @override
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.root:
        return materialRoute(const SettingsPage());

      default:
        return null;
    }
  }
}
