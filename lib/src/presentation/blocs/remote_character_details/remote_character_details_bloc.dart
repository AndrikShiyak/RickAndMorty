import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_clean_practice/src/core/enums/view_state.dart';
import '../../../core/params/episodes/get_episode_params.dart';
import '../../../core/resources/data_state.dart';
import '../../../domain/entities/character.dart';
import '../../../domain/entities/episode.dart';
import '../../../domain/usecases/get_episode_usecase.dart';
part 'remote_character_details_event.dart';
part 'remote_character_details_state.dart';

class RemoteCharacterDetailsBloc
    extends Bloc<RemoteCharacterDetailsEvent, RemoteCharacterDetailsState> {
  final GetEpisodeUseCase _getEpisodeUseCase;
  final Character character;

  RemoteCharacterDetailsBloc(
    this._getEpisodeUseCase,
    this.character,
  ) : super(RemoteCharacterDetailsState(
          status: ViewState.loading,
          character: character,
        )) {
    on<LoadEpisodes>(_loadEpisodes);
  }

  Future<Episode?> _loadEpisode(int id) async {
    final dataState =
        await _getEpisodeUseCase.call(params: GetEpisodeParams(id));

    if (dataState is DataFailed) {
      return null;
    }

    return dataState.data;
  }

  void _loadEpisodes(
      LoadEpisodes event, Emitter<RemoteCharacterDetailsState> emit) async {
    final character = state.character;

    var episodes = <Episode?>[];

    final episodesIds = <int>[];

    if (character.episode.isNotEmpty) {
      for (var episode in character.episode) {
        final id = int.parse(episode.split('/').last);

        episodesIds.add(id);
      }

      episodes = await Future.wait<Episode?>(
          [for (var id in episodesIds) _loadEpisode(id)]);

      character.setEpisodes = episodes;
      emit(
        state.copyWith(
          status: ViewState.success,
          character: character,
        ),
      );
    }
  }
}
