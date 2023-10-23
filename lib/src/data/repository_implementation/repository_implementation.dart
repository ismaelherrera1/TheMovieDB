import '../../core/util/data_state.dart';
import '../../core/util/enum_categories.dart';
import '../../domain/entities/genre.dart';
import '../../domain/repositories/i_movie_repository.dart';
import '../datasource/remote/movie_api_provider.dart';
import '../model/movie_model.dart';

class RemoteRepository extends IRepository {
  final MoviesApiProvider apiProvider;
  final String baseUrl = 'https://api.themoviedb.org/3/movie/';
  final String emptyResponseError = 'the response is empty';
  final String error = 'something went wrong in the repository implementation';
  final moviesApiProvider = MoviesApiProvider();
  final String popular = 'popular';
  final String topRated = 'top_rated';
  final String upcoming = 'upcoming';
  final String nowPlaying = 'now_playing';

  RemoteRepository({MoviesApiProvider? apiProvider})
      : apiProvider = apiProvider ?? MoviesApiProvider();

  @override
  Future<DataState<List<MovieDataModel>>> getMovies(Categories category) {
    switch (category) {
      case Categories.popular:
        return moviesApiProvider.fetchMovies('$baseUrl$popular');
      case Categories.top_rated:
        return moviesApiProvider.fetchMovies('$baseUrl$topRated');
      case Categories.upcoming:
        return moviesApiProvider.fetchMovies('$baseUrl$upcoming');
      case Categories.now_playing:
        return moviesApiProvider.fetchMovies('$baseUrl$nowPlaying');
    }
  }

  @override
  Future<DataState<List<Genre>>> getGenres() async {
    try {
      return moviesApiProvider.fetchGenres();
    }catch(e){
      return FailState(error);
    }
  }
}
