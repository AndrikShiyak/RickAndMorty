import '../../core/params/episodes/get_episode_params.dart';
import '../../core/params/episodes/get_episodes_params.dart';
import '../../core/resources/data_state.dart';
import '../entities/episode.dart';

abstract class EpisodesRepository {
  Future<DataState<List<Episode>>> getEpisodes(GetEpisodesParams params);

  Future<DataState<Episode>> getEpisode(GetEpisodeParams params);
}
