import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:rick_and_morty_clean_practice/src/core/services/dio/dio_factory.dart';
import 'package:rick_and_morty_clean_practice/src/core/utils/constants.dart';
import 'package:rick_and_morty_clean_practice/src/data/repositories/characters_repository_impl.dart';
import 'package:rick_and_morty_clean_practice/src/domain/repositories/characters_repository.dart';
import 'package:rick_and_morty_clean_practice/src/domain/usecases/get_character_usecase.dart';
import 'package:rick_and_morty_clean_practice/src/domain/usecases/get_characters_usecase.dart';
import 'package:rick_and_morty_clean_practice/src/presentation/blocs/remote_characters/bloc/remote_characters_bloc.dart';

import 'data/data_sources/remote/characters_api.dart';

final GetIt injector = GetIt.instance;

Future<void> initializeDependencies() async {
  //Dio
  injector.registerSingleton<Dio>(DioFactory(kBaseUrl).create());

  //API

  injector.registerSingleton<CharactersApiService>(
      CharactersApiService(injector()));

  //Repositories

  injector.registerSingleton<CharactersRepository>(
      CharactersRepositoryImpl(injector()));

  //UseCases

  injector.registerSingleton<GetCharactersUseCase>(
      GetCharactersUseCase(injector()));
  injector
      .registerSingleton<GetCharacterUseCase>(GetCharacterUseCase(injector()));

  //Blocs

  injector.registerFactory<RemoteCharactersBloc>(
    () => RemoteCharactersBloc(
      injector(),
      injector(),
    ),
  );
}
