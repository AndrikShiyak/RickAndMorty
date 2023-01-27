import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:rick_and_morty_clean_practice/src/core/utils/constants.dart';

part 'characters_api.g.dart';

@RestApi(baseUrl: kBaseUrl)
abstract class CharactersApiService {
  factory CharactersApiService(Dio dio, {String baseUrl}) =
      _CharactersApiService;

  @GET('/character')
  Future<HttpResponse<dynamic>> getCharacters(
    @Query('page') int page,
    @Queries() Map<String, String> options,
  );

  @GET('/character/{id}')
  Future<HttpResponse<dynamic>> getCharacter(@Path('id') int id);
}
