import '../../domain/entities/genre.dart';

class GenreDataModel extends Genre {

  GenreDataModel({
    required super.id,
    required super.name,
  });

  factory GenreDataModel.fromJson(Map<String, dynamic> json) {
    return GenreDataModel(
      id: json['id'],
      name: json['name'],
    );
  }
}
