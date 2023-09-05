import '../models/genre.dart';
import '../models/movie.dart';

abstract class IRepository<T> {
  Future<List<Movie>> readMovieData();
  Future<List<Genre>> readGenreData();
  Future<List<String>> getGenresByMovie(List<int> movieGenresIds);
}
