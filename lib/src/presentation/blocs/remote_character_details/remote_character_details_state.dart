part of 'remote_character_details_bloc.dart';

class RemoteCharacterDetailsState extends Equatable {
  const RemoteCharacterDetailsState({
    required this.status,
    this.character,
  });

  final ViewState status;
  final Character? character;

  RemoteCharacterDetailsState copyWith({
    Character? character,
    ViewState? status,
  }) {
    return RemoteCharacterDetailsState(
      character: character ?? this.character,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [status, character];
}
