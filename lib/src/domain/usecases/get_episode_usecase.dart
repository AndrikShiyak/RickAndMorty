import 'package:rick_and_morty_clean_practice/src/core/resources/data_state.dart';
import 'package:rick_and_morty_clean_practice/src/core/usecase/usecase.dart';
import 'package:rick_and_morty_clean_practice/src/domain/entities/episode.dart';
import '../../core/params/episodes/get_episode_params.dart';
import '../repositories/episodes_repository.dart';

class GetEpisodeUseCase
    implements UseCase<DataState<Episode>, GetEpisodeParams> {
  final EpisodesRepository _episodesRepository;

  GetEpisodeUseCase(this._episodesRepository);

  @override
  Future<DataState<Episode>> call({required GetEpisodeParams params}) {
    return _episodesRepository.getEpisode(params);
  }
}
