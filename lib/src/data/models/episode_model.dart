import 'package:rick_and_morty_clean_practice/src/domain/entities/episode.dart';

class EpisodeModel extends Episode {
  EpisodeModel({
    required super.id,
    required super.name,
    required super.url,
    required super.airDate,
    required super.episode,
    required super.characters,
    required super.created,
  });

  factory EpisodeModel.fromJson(Map<String, dynamic> map) {
    return EpisodeModel(
      id: map['id'] as int,
      name: map['name'] as String,
      episode: map['episode'] as String,
      airDate: map['air_date'] as String,
      characters: List<String>.from((map['characters'] as List<dynamic>)),
      url: map['url'] as String,
      created: map['created'] as String,
    );
  }
}
