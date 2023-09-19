import '../entities/genre.dart';
import '../entities/movie.dart';

abstract class IRepository<T> {
  Future<List<Movie>> readMovieData();
  Future<List<Genre>> readGenreData();
  Future<List<String>> getGenresByMovie(List<int> movieGenresIds);
}
