import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rick_and_morty_clean_practice/src/core/params/get_characters_params.dart';
import 'package:rick_and_morty_clean_practice/src/core/resources/data_state.dart';
import 'package:rick_and_morty_clean_practice/src/domain/entities/character.dart';
import 'package:rick_and_morty_clean_practice/src/domain/usecases/get_characters_usecase.dart';
import '../../../domain/usecases/get_character_usecase.dart';

part 'remote_characters_list_event.dart';
part 'remote_characters_list_state.dart';

class RemoteCharactersListBloc
    extends Bloc<RemoteCharactersListEvent, RemoteCharactersListState> {
  final GetCharactersUseCase _getCharactersUseCase;
  final GetCharacterUseCase _getCharacterUseCase;

  RemoteCharactersListBloc(
      this._getCharactersUseCase, this._getCharacterUseCase)
      : super(const RemoteCharactersListState()) {
    on<GetCharacters>(_getCharacters);
  }

  int _page = 1;
  static const int _pageSize = 20;

  void _getCharacters(
      GetCharacters event, Emitter<RemoteCharactersListState> emit) async {
    final dataState = await _getCharactersUseCase.call(
        params: GetCharactersParams(_page, null));

    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      final characters = dataState.data;
      final noMoreData = characters!.length < _pageSize;
      _page++;

      emit(
        state.copyWith(
          characters: List.from(state.characters ?? [])..addAll(characters),
          status: CharactersStatus.success,
          noMoreData: noMoreData,
        ),
      );
    }

    if (dataState is DataFailed) {
      emit(state.copyWith(
        status: CharactersStatus.error,
      ));
    }
  }
}
