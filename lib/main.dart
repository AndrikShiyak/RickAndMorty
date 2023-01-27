import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_clean_practice/src/config/routes/app_routes.dart';
import 'package:rick_and_morty_clean_practice/src/config/themes/app_theme.dart';
import 'package:rick_and_morty_clean_practice/src/injector.dart';
import 'package:rick_and_morty_clean_practice/src/presentation/blocs/remote_characters/bloc/remote_characters_bloc.dart';

import 'src/core/utils/constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initializeDependencies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RemoteCharactersBloc>(
      create: (_) => injector()..add(const GetCharacters()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: kMaterialAppTitle,
        theme: AppTheme.light,
        onGenerateRoute: AppRoutes.onGenerateRoutes,
      ),
    );
  }
}
