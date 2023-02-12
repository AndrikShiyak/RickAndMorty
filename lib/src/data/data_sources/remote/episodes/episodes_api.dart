import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:rick_and_morty_clean_practice/src/data/models/episode_model.dart';
import '../../../models/episodes_response_model.dart';

part 'episodes_api.g.dart';

@RestApi()
abstract class EpisodesApiService {
  factory EpisodesApiService(Dio dio, {String baseUrl}) = _EpisodesApiService;

  @GET('/episode')
  Future<HttpResponse<EpisodesResponseModel>> getEpisodes(
    @Query('page') int page,
    @Queries() Map<String, String>? options,
  );

  @GET('/episode/{id}')
  Future<HttpResponse<EpisodeModel>> getEpisode(@Path('id') int id);
}
