import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'characters_api.g.dart';

// @RestApi(baseUrl: kBaseUrl)
@RestApi()
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
