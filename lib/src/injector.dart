import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:rick_and_morty_clean_practice/src/core/services/dio/dio_factory.dart';
import 'package:rick_and_morty_clean_practice/src/core/utils/constants.dart';

import 'data/data_sources/remote/characters_api.dart';

final GetIt injector = GetIt.instance();

Future<void> initializeDependencies() async {
  //Dio
  injector.registerSingleton<Dio>(DioFactory(kBaseUrl).create());

  injector.registerSingleton<CharactersApiService>(
      CharactersApiService(injector()));
}
