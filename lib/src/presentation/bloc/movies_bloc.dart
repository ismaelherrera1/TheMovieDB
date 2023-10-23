import 'dart:async';

import '../../core/util/data_state.dart';
import '../../core/util/enum_categories.dart';
import '../../core/util/enum_states.dart';
import '../../domain/entities/movie.dart';
import '../../domain/entities/movie_state.dart';
import '../../domain/use_cases/implementation/now_playing_use_case.dart';
import '../../domain/use_cases/implementation/popular_movies_use_case.dart';
import '../../domain/use_cases/implementation/top_rated_use_case.dart';
import '../../domain/use_cases/implementation/upcoming_movies_use_case.dart';
import 'i_bloc.dart';

class MoviesBloc implements IBloc {
  final PopularMoviesUseCase popularMoviesUseCase;
  final TopRatedUseCase topRatedMoviesUseCase;
  final NowPlayingUseCase nowPlayingMoviesUseCase;
  final UpcomingMoviesUseCase upcomingMoviesUseCase;

  MoviesBloc({
    required this.popularMoviesUseCase,
    required this.topRatedMoviesUseCase,
    required this.nowPlayingMoviesUseCase,
    required this.upcomingMoviesUseCase,
  });

  final _movies = StreamController<MovieEvent>.broadcast();
  Stream<MovieEvent> get allMovies => _movies.stream;

  void getMovies(Categories category) async {
    DataState<List<Movie>> data;
    switch (category) {
      case Categories.popular:
        data = await popularMoviesUseCase.call();
      case Categories.now_playing:
        data = await nowPlayingMoviesUseCase.call();
      case Categories.top_rated:
        data = await topRatedMoviesUseCase.call();
      case Categories.upcoming:
        data = await upcomingMoviesUseCase.call();
    }
    if (data.state == BaseState.success) {
      _movies.sink.add(
        MovieEvent(
          state: BaseState.success,
          data: data.data,
        ),
      );
    }
  }

  @override
  void dispose() {
    _movies.close();
  }

  @override
  void initialize() {
    // TODO: implement initialize
  }
}
