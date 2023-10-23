import 'genre_model.dart';

class GenreListModel {
  List<GenreDataModel> results;

  GenreListModel({required this.results});

  factory GenreListModel.fromJson(Map<String, dynamic> json) {
    List<GenreDataModel> genres = [];

    for (int i = 0; i < json['genres'].length; i++) {
      GenreDataModel genre = GenreDataModel.fromJson(json['genres'][i]);
      genres.add(genre);
    }
    return GenreListModel(
      results: genres,
    );
  }
}
