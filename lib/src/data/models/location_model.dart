import '../../domain/entities/location.dart';

class LocationModel extends Location {
  const LocationModel({
    required super.name,
    required super.url,
  });

  factory LocationModel.fromJson(Map<String, dynamic> map) {
    return LocationModel(
      name: map['name'] as String,
      url: map['url'] as String,
    );
  }
}
