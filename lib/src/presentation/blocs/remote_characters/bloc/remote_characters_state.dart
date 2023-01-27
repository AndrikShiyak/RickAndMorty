part of 'remote_characters_bloc.dart';

abstract class RemoteCharactersState extends Equatable {
  final dynamic characters;
  final bool noMoreData;
  final DioError? error;

  const RemoteCharactersState({
    this.characters,
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
  const RemoteCharactersDone(dynamic characters, {bool noMoreData = false})
      : super(
          characters: characters,
          noMoreData: noMoreData,
        );
}

class RemoteCharactersError extends RemoteCharactersState {
  const RemoteCharactersError(DioError error) : super(error: error);
}
