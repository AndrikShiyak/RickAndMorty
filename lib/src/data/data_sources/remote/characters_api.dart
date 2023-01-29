import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:rick_and_morty_clean_practice/src/data/models/character_model.dart';

import '../../models/characters_response_model.dart';

part 'characters_api.g.dart';

// @RestApi(baseUrl: kBaseUrl)
@RestApi()
abstract class CharactersApiService {
  factory CharactersApiService(Dio dio, {String baseUrl}) =
      _CharactersApiService;

  @GET('/character')
  Future<HttpResponse<CharactersResponseModel>> getCharacters(
    @Query('page') int page,
    @Queries() Map<String, String>? options,
  );

  @GET('/character/{id}')
  Future<HttpResponse<CharacterModel>> getCharacter(@Path('id') int id);
}
