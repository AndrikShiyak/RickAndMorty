import 'dart:io';

import 'package:dio/dio.dart';
import 'package:rick_and_morty_clean_practice/src/core/resources/data_state.dart';
import '../../core/params/episodes/get_episode_params.dart';
import '../../core/params/episodes/get_episodes_params.dart';
import '../../domain/entities/episode.dart';
import '../../domain/repositories/episodes_repository.dart';
import '../data_sources/remote/episodes/episodes_api.dart';

class EpisodesRepositoryImpl implements EpisodesRepository {
  final EpisodesApiService _episodesApiService;

  EpisodesRepositoryImpl(this._episodesApiService);

  @override
  Future<DataState<Episode>> getEpisode(GetEpisodeParams params) async {
    try {
      final httpResponse =
          await _episodesApiService.getEpisode(params.episodeId);

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      }
      return DataFailed(
        DioError(
          error: httpResponse.response.statusMessage,
          response: httpResponse.response,
          requestOptions: httpResponse.response.requestOptions,
          type: DioErrorType.response,
        ),
      );
    } on DioError catch (e) {
      return DataFailed(e);
    }
  }

  @override
  Future<DataState<List<Episode>>> getEpisodes(GetEpisodesParams params) async {
    try {
      final httpResponse = await _episodesApiService.getEpisodes(
        params.page,
        params.options,
      );

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data.characterInfo);
      }
      return DataFailed(
        DioError(
          error: httpResponse.response.statusMessage,
          response: httpResponse.response,
          requestOptions: httpResponse.response.requestOptions,
          type: DioErrorType.response,
        ),
      );
    } on DioError catch (e) {
      return DataFailed(e);
    }
  }
}
