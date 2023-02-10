import 'package:flutter/material.dart';
import 'package:rick_and_morty_clean_practice/src/config/routes/tab_router.dart';
import 'package:rick_and_morty_clean_practice/src/presentation/pages/locations/location_details_page.dart';
import '../../presentation/pages/locations/locations_list_page.dart';

class LocationsTabRouter extends TabRouter {
  final GlobalKey<NavigatorState> _key = GlobalKey<NavigatorState>();

  @override
  GlobalKey<NavigatorState> get key => _key;

  @override
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case _LocationsTabRoutes.locations:
        return materialRoute(const LocationsListPage());

      case _LocationsTabRoutes.locationDetails:
        return materialRoute(LocationDetailsPage(
          characterId: settings.arguments as int,
        ));

      default:
        return null;
    }
  }
}

class _LocationsTabRoutes {
  _LocationsTabRoutes._();

  static const String locations = '/';
  static const String locationDetails = '/location_details';
}
