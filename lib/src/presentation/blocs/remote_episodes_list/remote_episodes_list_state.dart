part of 'remote_episodes_list_bloc.dart';

class RemoteEpisodesListState extends Equatable {
  const RemoteEpisodesListState({
    this.status = ViewState.loading,
    this.episodes,
    this.episode,
    this.noMoreData = false,
  });

  final List<Episode>? episodes;
  final Episode? episode;
  final ViewState status;
  final bool noMoreData;

  RemoteEpisodesListState copyWith({
    List<Episode>? episodes,
    Episode? episode,
    ViewState? status,
    bool? noMoreData,
  }) {
    return RemoteEpisodesListState(
      episodes: episodes ?? this.episodes,
      episode: episode ?? this.episode,
      status: status ?? this.status,
      noMoreData: noMoreData ?? this.noMoreData,
    );
  }

  @override
  List<Object?> get props => [status, episodes, episode, noMoreData];
}
