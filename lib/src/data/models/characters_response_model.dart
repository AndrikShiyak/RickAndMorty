import 'package:rick_and_morty_clean_practice/src/data/models/character_model.dart';

import 'page_info_model.dart';

class CharactersResponseModel {
  final PageInfoModel pageInfo;
  final List<CharacterModel> characterInfo;

  CharactersResponseModel({
    required this.pageInfo,
    required this.characterInfo,
  });

  factory CharactersResponseModel.fromJson(Map<String, dynamic> map) {
    return CharactersResponseModel(
      pageInfo: PageInfoModel.fromJson(map['info'] as Map<String, dynamic>),
      characterInfo: List<CharacterModel>.from(
        (map['results'] as List<dynamic>).map<CharacterModel>(
          (x) => CharacterModel.fromJson(x as Map<String, dynamic>),
        ),
      ),
    );
  }
}
