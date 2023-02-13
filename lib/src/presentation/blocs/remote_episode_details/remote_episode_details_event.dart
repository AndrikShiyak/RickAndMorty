part of 'remote_episode_details_bloc.dart';

abstract class RemoteEpisodeDetailsEvent extends Equatable {
  const RemoteEpisodeDetailsEvent({this.episodeId});

  final int? episodeId;

  @override
  List<Object> get props => [];
}

class GetEpisode extends RemoteEpisodeDetailsEvent {
  const GetEpisode(int episodeId) : super(episodeId: episodeId);
}
