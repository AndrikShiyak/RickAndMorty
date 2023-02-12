import '../../core/params/characters/get_character_params.dart';
import '../../core/params/characters/get_characters_params.dart';
import '../../core/resources/data_state.dart';
import '../entities/character.dart';

abstract class CharactersRepository {
  Future<DataState<List<Character>>> getCharacters(GetCharactersParams params);

  Future<DataState<Character>> getCharacter(GetCharacterParams params);
}
