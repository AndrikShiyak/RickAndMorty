part of 'remote_characters_bloc.dart';

abstract class RemoteCharactersEvent extends Equatable {
  final dynamic character;

  const RemoteCharactersEvent({this.character});

  @override
  List<Object?> get props => [];
}

class GetCharacters extends RemoteCharactersEvent {
  const GetCharacters();
}

class GetCharacter extends RemoteCharactersEvent {
  const GetCharacter(dynamic character) : super(character: character);
}
