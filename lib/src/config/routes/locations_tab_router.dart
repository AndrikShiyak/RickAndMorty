import 'package:flutter/material.dart';
import 'package:rick_and_morty_clean_practice/src/config/routes/tab_router.dart';
import 'package:rick_and_morty_clean_practice/src/presentation/pages/locations/location_details_page.dart';
import '../../presentation/pages/locations/locations_list_page.dart';
import 'app_routes.dart';

class LocationsTabRouter extends TabRouter {
  final GlobalKey<NavigatorState> _key = GlobalKey<NavigatorState>();

  @override
  GlobalKey<NavigatorState> get key => _key;

  @override
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.root:
        return materialRoute(const LocationsListPage());

      case AppRoutes.locationDetails:
        return materialRoute(LocationDetailsPage(
          characterId: settings.arguments as int,
        ));

      default:
        return null;
    }
  }
}
