import 'package:equatable/equatable.dart';
import 'package:rick_and_morty_clean_practice/src/domain/entities/episode.dart';

import 'location.dart';
import 'origin.dart';

// ignore: must_be_immutable
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
  List<Episode?>? _episodes;

  Character({
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

  List<Episode?> get getEpisodes => _episodes ?? [];

  set setEpisodes(List<Episode?> episodesList) {
    if (_episodes != null && _episodes!.isNotEmpty) return;

    _episodes = episodesList;
  }

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
