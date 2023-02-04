import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:ionicons/ionicons.dart';
import 'package:rick_and_morty_clean_practice/src/core/enums/view_state.dart';

class StatePage extends HookWidget {
  const StatePage({
    super.key,
    required this.child,
    required this.state,
  });

  final Widget child;
  final ViewState state;

  @override
  Widget build(BuildContext context) {
    if (state == ViewState.loading) {
      return const Material(child: Center(child: CupertinoActivityIndicator()));
    }
    if (state == ViewState.error) {
      return const Material(child: Center(child: Icon(Ionicons.refresh)));
    }
    if (state == ViewState.success) {
      return child;
    }
    return const SizedBox();
  }
}
