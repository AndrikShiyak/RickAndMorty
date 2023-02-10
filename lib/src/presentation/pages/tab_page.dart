import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import '../../config/routes/tab_router.dart';

class TabPage extends HookWidget {
  const TabPage({
    super.key,
    required this.router,
    this.offstage = false,
  });

  final TabRouter router;
  final bool offstage;

  @override
  Widget build(BuildContext context) {
    return Offstage(
      offstage: offstage,
      child: Navigator(
        key: router.key,
        onGenerateRoute: router.onGenerateRoute,
      ),
    );
  }
}
