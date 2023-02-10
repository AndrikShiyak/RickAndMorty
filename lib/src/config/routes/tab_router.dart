import 'package:flutter/material.dart';

abstract class TabRouter {
  Route? onGenerateRoute(RouteSettings settings);

  Route<dynamic> materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }

  GlobalKey<NavigatorState> get key;
}
