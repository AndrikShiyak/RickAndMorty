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

// abstract class RemoteCharactersState extends Equatable {
//   final List<Character>? characters;
//   final Character? character;
//   final bool noMoreData;
//   final DioError? error;

//   const RemoteCharactersState({
//     this.characters,
//     this.character,
//     this.noMoreData = false,
//     this.error,
//   });

//   @override
//   List<Object?> get props => [characters, noMoreData, error];
// }

// class RemoteCharactersLoading extends RemoteCharactersState {
//   const RemoteCharactersLoading();
// }

// class RemoteCharactersDone extends RemoteCharactersState {
//   const RemoteCharactersDone(
//       {List<Character>? characters,
//       Character? character,
//       bool noMoreData = false})
//       : super(
//           characters: characters,
//           character: character,
//           noMoreData: noMoreData,
//         );

//   // RemoteCharactersState copyWith({
//   //   List<Character>? characters,
//   //   Character? character,
//   //   bool? noMoreData,
//   //   DioError? error,
//   // }) {
//   //   return RemoteCharactersDone(
//   //     characters: characters ?? this.characters,
//   //     character: character ?? this.character,
//   //     noMoreData: noMoreData ?? this.noMoreData,
//   //   );
//   // }
// }

// class RemoteCharactersError extends RemoteCharactersState {
//   // const RemoteCharactersError(DioError error) : super(error: error);
//   // const RemoteCharactersError(;

//   // RemoteCharactersError copyWith({
//   //   DioError? error,
//   // }) {
//   //   return RemoteCharactersError(
//   //     error: error ?? this.error,
//   //   );
//   // }
// }
