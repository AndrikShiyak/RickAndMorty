import 'dart:io';

import 'package:dio/dio.dart';
import 'package:rick_and_morty_clean_practice/src/core/resources/data_state.dart';
import 'package:rick_and_morty_clean_practice/src/core/params/get_characters_params.dart';
import 'package:rick_and_morty_clean_practice/src/core/params/get_character_params.dart';
import 'package:rick_and_morty_clean_practice/src/domain/repositories/characters_repository.dart';

import '../data_sources/remote/characters_api.dart';

class CharactersRepositoryImpl implements CharactersRepository {
  final CharactersApiService _charactersApiService;

  CharactersRepositoryImpl(this._charactersApiService);

  @override
  Future<DataState<dynamic>> getCharacter(GetCharacterParams params) async {
    try {
      final httpResponse =
          await _charactersApiService.getCharacter(params.characterId);

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.response.data);
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
  Future<DataState<dynamic>> getCharacters(GetCharactersParams params) async {
    try {
      final httpResponse = await _charactersApiService.getCharacters(
        params.page,
        params.options,
      );

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
}
