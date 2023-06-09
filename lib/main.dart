import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_clean_practice/src/config/themes/app_theme.dart';
import 'package:rick_and_morty_clean_practice/src/injector.dart';
import 'package:rick_and_morty_clean_practice/src/presentation/pages/home_page.dart';

import 'src/core/utils/app_bloc_observer.dart';
import 'src/core/utils/constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initializeDependencies();

  Bloc.observer = AppBlocObserver();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: kMaterialAppTitle,
      theme: AppTheme.light,
      home: const HomePage(),
    );
  }
}
