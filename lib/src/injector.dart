import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:rick_and_morty_clean_practice/src/core/services/dio/dio_factory.dart';
import 'package:rick_and_morty_clean_practice/src/core/utils/constants.dart';
import 'package:rick_and_morty_clean_practice/src/data/repositories/characters_repository_impl.dart';
import 'package:rick_and_morty_clean_practice/src/domain/repositories/characters_repository.dart';
import 'package:rick_and_morty_clean_practice/src/domain/usecases/get_character_usecase.dart';
import 'package:rick_and_morty_clean_practice/src/domain/usecases/get_characters_usecase.dart';
import 'package:rick_and_morty_clean_practice/src/presentation/blocs/remote_episodes_list/remote_episodes_list_bloc.dart';
import 'data/data_sources/remote/characters/characters_api.dart';
import 'data/data_sources/remote/episodes/episodes_api.dart';
import 'data/repositories/episodes_repository_impl.dart';
import 'domain/repositories/episodes_repository.dart';
import 'domain/usecases/get_episode_usecase.dart';
import 'domain/usecases/get_episodes_usecase.dart';
import 'presentation/blocs/remote_characters_list/remote_characters_list_bloc.dart';
import 'presentation/blocs/remote_episode_details/remote_episode_details_bloc.dart';

final GetIt injector = GetIt.instance;

Future<void> initializeDependencies() async {
  //Dio
  injector.registerSingleton<Dio>(DioFactory(kBaseUrl).create());

  //API

  injector.registerSingleton<CharactersApiService>(
      CharactersApiService(injector()));

  injector
      .registerSingleton<EpisodesApiService>(EpisodesApiService(injector()));

  //Repositories

  injector.registerSingleton<CharactersRepository>(
      CharactersRepositoryImpl(injector()));

  injector.registerSingleton<EpisodesRepository>(
      EpisodesRepositoryImpl(injector()));

  //UseCases

  injector.registerSingleton<GetCharactersUseCase>(
      GetCharactersUseCase(injector()));
  injector
      .registerSingleton<GetCharacterUseCase>(GetCharacterUseCase(injector()));

  injector
      .registerSingleton<GetEpisodesUseCase>(GetEpisodesUseCase(injector()));
  injector.registerSingleton<GetEpisodeUseCase>(GetEpisodeUseCase(injector()));

  //Blocs

  injector.registerFactory<RemoteCharactersListBloc>(
    () => RemoteCharactersListBloc(injector()),
  );

  injector.registerFactory<RemoteEpisodesListBloc>(
    () => RemoteEpisodesListBloc(
      injector(),
    ),
  );
  injector.registerFactory<RemoteEpisodeDetailsBloc>(
    () => RemoteEpisodeDetailsBloc(
      injector(),
    ),
  );
}
