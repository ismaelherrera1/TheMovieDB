import 'movie_model.dart';

class MovieListModel {
  int page;
  int totalResults;
  int totalPages;
  List<MovieDataModel> results;

  MovieListModel({
    required this.page,
    required this.totalResults,
    required this.totalPages,
    required this.results,
  });

  factory MovieListModel.fromJson(Map<String, dynamic> json) {
    List<MovieDataModel> movies = [];

    for (int i = 0; i < json['results'].length; i++) {
      MovieDataModel movie = MovieDataModel.fromJson(json['results'][i]);
      movies.add(movie);
    }

    return MovieListModel(
      page: json['page'],
      totalResults: json['total_results'],
      totalPages: json['total_pages'],
      results: movies,
    );
  }

  List<MovieDataModel> get getResults => results;
}
