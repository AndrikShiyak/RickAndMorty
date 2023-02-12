part of 'remote_episodes_list_bloc.dart';

class RemoteEpisodesListState extends Equatable {
  const RemoteEpisodesListState({
    this.status = ViewState.loading,
    this.episodes,
    this.noMoreData = false,
  });

  final List<Episode>? episodes;
  final ViewState status;
  final bool noMoreData;

  RemoteEpisodesListState copyWith({
    List<Episode>? episodes,
    ViewState? status,
    bool? noMoreData,
  }) {
    return RemoteEpisodesListState(
      episodes: episodes ?? this.episodes,
      status: status ?? this.status,
      noMoreData: noMoreData ?? this.noMoreData,
    );
  }

  @override
  List<Object?> get props => [status, episodes, noMoreData];
}
