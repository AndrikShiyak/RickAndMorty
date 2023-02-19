import '../../domain/entities/character.dart';
import 'location_model.dart';
import 'origin_model.dart';

// ignore: must_be_immutable
class CharacterModel extends Character {
  CharacterModel({
    required super.id,
    required super.name,
    required super.status,
    required super.species,
    required super.type,
    required super.gender,
    required super.origin,
    required super.location,
    required super.image,
    required super.episode,
    required super.url,
    required super.created,
  });

  factory CharacterModel.fromJson(Map<String, dynamic> map) {
    return CharacterModel(
      id: map['id'] as int,
      name: map['name'] as String,
      status: map['status'] as String,
      species: map['species'] as String,
      type: map['type'] as String,
      gender: map['gender'] as String,
      origin: OriginModel.fromJson(map['origin'] as Map<String, dynamic>),
      location: LocationModel.fromJson(map['location'] as Map<String, dynamic>),
      image: map['image'] as String,
      episode: List<String>.from((map['episode'] as List<dynamic>)),
      url: map['url'] as String,
      created: map['created'] as String,
    );
  }
}
