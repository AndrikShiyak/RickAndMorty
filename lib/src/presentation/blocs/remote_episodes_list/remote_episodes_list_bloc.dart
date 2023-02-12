import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rick_and_morty_clean_practice/src/core/enums/view_state.dart';
import 'package:rick_and_morty_clean_practice/src/core/resources/data_state.dart';
import 'package:rick_and_morty_clean_practice/src/domain/entities/episode.dart';
import '../../../core/params/episodes/get_episodes_params.dart';
import '../../../domain/usecases/get_episodes_usecase.dart';

part 'remote_episodes_list_event.dart';
part 'remote_episodes_list_state.dart';

class RemoteEpisodesListBloc
    extends Bloc<RemoteEpisodesListEvent, RemoteEpisodesListState> {
  final GetEpisodesUseCase _getEpisodesUseCase;

  RemoteEpisodesListBloc(this._getEpisodesUseCase)
      : super(const RemoteEpisodesListState()) {
    on<GetEpisodes>(_getEpisodes);
  }

  int _page = 1;
  static const int _pageSize = 20;

  void _getEpisodes(
      GetEpisodes event, Emitter<RemoteEpisodesListState> emit) async {
    final dataState =
        await _getEpisodesUseCase.call(params: GetEpisodesParams(_page, null));

    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      final episodes = dataState.data;
      final noMoreData = episodes!.length < _pageSize;
      print('asdklaskdl $noMoreData');
      _page++;

      emit(
        state.copyWith(
          episodes: List.from(state.episodes ?? [])..addAll(episodes),
          status: ViewState.success,
          noMoreData: noMoreData,
        ),
      );
    }

    if (dataState is DataFailed) {
      emit(state.copyWith(
        status: ViewState.error,
      ));
    }
  }
}
