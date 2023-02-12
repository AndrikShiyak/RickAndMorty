part of 'remote_episodes_list_bloc.dart';

abstract class RemoteEpisodesListEvent extends Equatable {
  final int? episodeId;

  const RemoteEpisodesListEvent({this.episodeId});

  @override
  List<Object?> get props => [episodeId];
}

class GetEpisodes extends RemoteEpisodesListEvent {
  const GetEpisodes();
}
