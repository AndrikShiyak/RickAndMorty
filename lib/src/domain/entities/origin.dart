import 'package:equatable/equatable.dart';

class Origin extends Equatable {
  final String name;
  final String url;

  const Origin({
    required this.name,
    required this.url,
  });

  @override
  List<Object?> get props => [name, url];
}
