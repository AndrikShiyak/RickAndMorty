import '../../domain/entities/origin.dart';

class OriginModel extends Origin {
  const OriginModel({
    required super.name,
    required super.url,
  });

  factory OriginModel.fromMap(Map<String, dynamic> map) {
    return OriginModel(
      name: map['name'] as String,
      url: map['url'] as String,
    );
  }
}
