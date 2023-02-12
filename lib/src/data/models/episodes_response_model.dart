import 'package:rick_and_morty_clean_practice/src/data/models/episode_model.dart';

import 'page_info_model.dart';

class EpisodesResponseModel {
  final PageInfoModel pageInfo;
  final List<EpisodeModel> characterInfo;

  EpisodesResponseModel({
    required this.pageInfo,
    required this.characterInfo,
  });

  factory EpisodesResponseModel.fromJson(Map<String, dynamic> map) {
    return EpisodesResponseModel(
      pageInfo: PageInfoModel.fromJson(map['info'] as Map<String, dynamic>),
      characterInfo: List<EpisodeModel>.from(
        (map['results'] as List<dynamic>).map<EpisodeModel>(
          (x) => EpisodeModel.fromJson(x as Map<String, dynamic>),
        ),
      ),
    );
  }
}
