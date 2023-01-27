import 'package:rick_and_morty_clean_practice/src/core/params/get_character_params.dart';
import 'package:rick_and_morty_clean_practice/src/core/resources/data_state.dart';
import 'package:rick_and_morty_clean_practice/src/core/usecase/usecase.dart';
import 'package:rick_and_morty_clean_practice/src/domain/repositories/characters_repository.dart';

class GetCharacterUseCase
    implements UseCase<DataState<dynamic>, GetCharacterParams> {
  final CharactersRepository _charactersRepository;

  GetCharacterUseCase(this._charactersRepository);

  @override
  Future<DataState> call({required GetCharacterParams params}) {
    return _charactersRepository.getCharacter(params);
  }
}
