part of 'remote_characters_list_bloc.dart';

abstract class RemoteCharactersListEvent extends Equatable {
  final int? characterId;

  const RemoteCharactersListEvent({this.characterId});

  @override
  List<Object?> get props => [characterId];
}

class GetCharacters extends RemoteCharactersListEvent {
  const GetCharacters();
}
