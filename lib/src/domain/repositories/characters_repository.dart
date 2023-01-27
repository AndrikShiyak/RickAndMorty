import '../../core/params/get_character_params.dart';
import '../../core/params/get_characters_params.dart';
import '../../core/resources/data_state.dart';

abstract class CharactersRepository {
  Future<DataState<dynamic>> getCharacters(GetCharactersParams params);

  Future<DataState<dynamic>> getCharacter(GetCharacterParams params);
}
