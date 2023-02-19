part of 'remote_character_details_bloc.dart';

abstract class RemoteCharacterDetailsEvent extends Equatable {
  const RemoteCharacterDetailsEvent();

  @override
  List<Object?> get props => [];
}

class LoadEpisodes extends RemoteCharacterDetailsEvent {
  const LoadEpisodes() : super();
}
