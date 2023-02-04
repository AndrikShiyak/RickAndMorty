import 'package:equatable/equatable.dart';

import 'location.dart';
import 'origin.dart';

class Character extends Equatable {
  final int id;
  final String name;
  final String status;
  final String species;
  final String type;
  final String gender;
  final Origin origin;
  final Location location;
  final String image;
  final List<String> episode;
  final String url;
  final String created;

  const Character({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.type,
    required this.gender,
    required this.origin,
    required this.location,
    required this.image,
    required this.episode,
    required this.url,
    required this.created,
  });

  Map<String, String> get infoMap => {
        'Name: ': name,
        'Species: ': species,
        'Gender: ': gender,
        'Status: ': status,
        'Type: ': type,
        'Origin: ': origin.name,
        'Location: ': location.name,
      };

  @override
  List<Object?> get props => [
        id,
        name,
        status,
        species,
        type,
        gender,
        origin,
        location,
        image,
        episode,
        url,
        created,
      ];
}
