part of 'remote_characters_bloc.dart';

abstract class RemoteCharactersState extends Equatable {
  final List<Character>? characters;
  final Character? character;
  final bool noMoreData;
  final DioError? error;

  const RemoteCharactersState({
    this.characters,
    this.character,
    this.noMoreData = false,
    this.error,
  });

  @override
  List<Object?> get props => [characters, noMoreData, error];
}

class RemoteCharactersLoading extends RemoteCharactersState {
  const RemoteCharactersLoading();
}

class RemoteCharactersDone extends RemoteCharactersState {
  const RemoteCharactersDone(
      {List<Character>? characters,
      Character? character,
      bool noMoreData = false})
      : super(
          characters: characters,
          character: character,
          noMoreData: noMoreData,
        );
}

class RemoteCharactersError extends RemoteCharactersState {
  const RemoteCharactersError(DioError error) : super(error: error);
}
