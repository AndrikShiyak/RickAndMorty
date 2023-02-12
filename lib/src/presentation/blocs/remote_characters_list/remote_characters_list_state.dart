part of 'remote_characters_list_bloc.dart';

class RemoteCharactersListState extends Equatable {
  const RemoteCharactersListState({
    this.status = ViewState.loading,
    this.characters,
    this.character,
    this.noMoreData = false,
  });

  final List<Character>? characters;
  final Character? character;
  final ViewState status;
  final bool noMoreData;

  RemoteCharactersListState copyWith({
    List<Character>? characters,
    Character? character,
    ViewState? status,
    bool? noMoreData,
  }) {
    return RemoteCharactersListState(
      characters: characters ?? this.characters,
      character: character ?? this.character,
      status: status ?? this.status,
      noMoreData: noMoreData ?? this.noMoreData,
    );
  }

  @override
  List<Object?> get props => [status, characters, character, noMoreData];
}
