import 'package:rick_and_morty_clean_practice/src/data/models/character_model.dart';

import 'page_info_model.dart';

class CharactersResponseModel {
  final PageInfoModel pageInfo;
  final List<CharacterModel> characterInfo;

  CharactersResponseModel({
    required this.pageInfo,
    required this.characterInfo,
  });

  factory CharactersResponseModel.fromMap(Map<String, dynamic> map) {
    return CharactersResponseModel(
      pageInfo: PageInfoModel.fromMap(map['pageInfo'] as Map<String, dynamic>),
      characterInfo: List<CharacterModel>.from(
        (map['characterInfo'] as List<int>).map<CharacterModel>(
          (x) => CharacterModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }
}
