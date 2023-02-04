import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rick_and_morty_clean_practice/src/core/enums/view_state.dart';
import '../../../core/params/get_character_params.dart';
import '../../../core/resources/data_state.dart';
import '../../../domain/entities/character.dart';
import '../../../domain/usecases/get_character_usecase.dart';

part 'remote_character_details_event.dart';
part 'remote_character_details_state.dart';

class RemoteCharacterDetailsBloc
    extends Bloc<RemoteCharacterDetailsEvent, RemoteCharacterDetailsState> {
  final GetCharacterUseCase _getCharacterUseCase;

  RemoteCharacterDetailsBloc(this._getCharacterUseCase)
      : super(const RemoteCharacterDetailsState(
          status: ViewState.loading,
        )) {
    on<GetCharacter>(_getCharacter);
  }

  void _getCharacter(
      GetCharacter event, Emitter<RemoteCharacterDetailsState> emit) async {
    final dataState = await _getCharacterUseCase.call(
        params: GetCharacterParams(event.characterId!));

    if (dataState is DataSuccess) {
      final character = dataState.data;

      emit(state.copyWith(
        character: character,
        status: ViewState.success,
      ));
    }

    if (dataState is DataFailed) {
      emit(state.copyWith(status: ViewState.error));
    }
  }
}
