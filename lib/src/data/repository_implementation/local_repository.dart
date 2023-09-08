import 'dart:convert';
import 'package:flutter/services.dart';
import '../../domain/repositories/i_movie_repository.dart';
import '../../domain/entities/genre.dart';
import '../../domain/entities/movie.dart';

class LocalRepository extends IRepository {
  static const String genresPath = 'assets/mocks/genres.json';
  static const String moviesPath = 'assets/mocks/movies.json';

  @override
  Future<List<String>> getGenresByMovie(List<int> movieGenresIds) async {
    List<Genre> genres = await readGenreData();
    List<String> movieCorrespondingGenres = genres
        .where((genre) => movieGenresIds.contains(genre.id))
        .map((genre) => genre.name)
        .toList();
    return movieCorrespondingGenres;
  }

  @override
  Future<List<Genre>> readGenreData() async {
    const String path = genresPath;
    final String jsonString = await rootBundle.loadString(path);
    var genreData = jsonDecode(jsonString);
    List<dynamic> genreList = genreData['genres'];
    return genreList.map((e) => Genre.fromJson(e)).toList();
  }

  @override
  Future<List<Movie>> readMovieData() async {
    const String path = moviesPath;
    final String jsonString = await rootBundle.loadString(path);
    List<dynamic> movieData = jsonDecode(jsonString);
    return movieData.map((e) => Movie.fromJson(e)).toList();
  }
}
