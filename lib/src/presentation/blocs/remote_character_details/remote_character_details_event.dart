part of 'remote_character_details_bloc.dart';

abstract class RemoteCharacterDetailsEvent extends Equatable {
  const RemoteCharacterDetailsEvent({this.characterId});

  final int? characterId;

  @override
  List<Object> get props => [];
}

class GetCharacter extends RemoteCharacterDetailsEvent {
  const GetCharacter(int characterId) : super(characterId: characterId);
}
