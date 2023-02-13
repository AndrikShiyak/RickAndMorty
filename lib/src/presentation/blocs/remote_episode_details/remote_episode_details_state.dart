part of 'remote_episode_details_bloc.dart';

class RemoteEpisodeDetailsState extends Equatable {
  const RemoteEpisodeDetailsState({
    required this.status,
    this.episode,
  });

  final ViewState status;
  final Episode? episode;

  RemoteEpisodeDetailsState copyWith({
    Episode? episode,
    ViewState? status,
  }) {
    return RemoteEpisodeDetailsState(
      episode: episode ?? this.episode,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [status, episode];
}
