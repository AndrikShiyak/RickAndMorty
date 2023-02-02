part of 'remote_characters_bloc.dart';

abstract class RemoteCharactersEvent extends Equatable {
  final Character? character;

  const RemoteCharactersEvent({this.character});

  @override
  List<Object?> get props => [character];
}

class GetCharacters extends RemoteCharactersEvent {
  const GetCharacters();
}

class GetCharacter extends RemoteCharactersEvent {
  const GetCharacter(Character character) : super(character: character);
}
