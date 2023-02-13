import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rick_and_morty_clean_practice/src/core/enums/view_state.dart';
import 'package:rick_and_morty_clean_practice/src/domain/usecases/get_episode_usecase.dart';
import '../../../core/params/episodes/get_episode_params.dart';
import '../../../core/resources/data_state.dart';
import '../../../domain/entities/episode.dart';

part 'remote_episode_details_event.dart';
part 'remote_episode_details_state.dart';

class RemoteEpisodeDetailsBloc
    extends Bloc<RemoteEpisodeDetailsEvent, RemoteEpisodeDetailsState> {
  final GetEpisodeUseCase _getEpisodeUseCase;

  RemoteEpisodeDetailsBloc(this._getEpisodeUseCase)
      : super(const RemoteEpisodeDetailsState(
          status: ViewState.loading,
        )) {
    on<GetEpisode>(_getEpisode);
  }

  void _getEpisode(
      GetEpisode event, Emitter<RemoteEpisodeDetailsState> emit) async {
    final dataState = await _getEpisodeUseCase.call(
        params: GetEpisodeParams(event.episodeId!));

    if (dataState is DataSuccess) {
      final episode = dataState.data;

      emit(state.copyWith(
        episode: episode,
        status: ViewState.success,
      ));
    }

    if (dataState is DataFailed) {
      emit(state.copyWith(status: ViewState.error));
    }
  }
}
