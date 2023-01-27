import 'package:rick_and_morty_clean_practice/src/core/params/get_characters_params.dart';
import 'package:rick_and_morty_clean_practice/src/core/resources/data_state.dart';
import 'package:rick_and_morty_clean_practice/src/core/usecase/usecase.dart';
import 'package:rick_and_morty_clean_practice/src/domain/repositories/characters_repository.dart';

class GetCharactersUseCase
    implements UseCase<DataState<dynamic>, GetCharactersParams> {
  final CharactersRepository _charactersRepository;

  GetCharactersUseCase(this._charactersRepository);

  @override
  Future<DataState> call({required GetCharactersParams params}) {
    return _charactersRepository.getCharacters(params);
  }
}
