import 'package:rick_and_morty_clean_practice/src/core/resources/data_state.dart';
import 'package:rick_and_morty_clean_practice/src/core/usecase/usecase.dart';
import 'package:rick_and_morty_clean_practice/src/domain/entities/episode.dart';
import '../../core/params/episodes/get_episodes_params.dart';
import '../repositories/episodes_repository.dart';

class GetEpisodesUseCase
    implements UseCase<DataState<List<Episode>>, GetEpisodesParams> {
  final EpisodesRepository _episodesRepository;

  GetEpisodesUseCase(this._episodesRepository);

  @override
  Future<DataState<List<Episode>>> call({required GetEpisodesParams params}) {
    return _episodesRepository.getEpisodes(params);
  }
}
