part of 'remote_characters_bloc.dart';

enum CharactersStatus { initial, success, error, loading }

class RemoteCharactersState extends Equatable {
  const RemoteCharactersState({
    this.status = CharactersStatus.initial,
    this.characters,
    this.noMoreData = false,
  });

  final List<Character>? characters;
  final CharactersStatus status;
  final bool noMoreData;

  RemoteCharactersState copyWith({
    List<Character>? characters,
    CharactersStatus? status,
    bool? noMoreData,
  }) {
    return RemoteCharactersState(
      characters: characters ?? this.characters,
      status: status ?? this.status,
      noMoreData: noMoreData ?? this.noMoreData,
    );
  }

  @override
  List<Object?> get props => [status, characters, noMoreData];
}
