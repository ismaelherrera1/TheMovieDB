import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:the_movie_db/src/core/util/data_state.dart';
import 'package:the_movie_db/src/core/util/enum_states.dart';
import 'package:the_movie_db/src/core/util/movie_related_mocks.dart';
import 'package:the_movie_db/src/domain/entities/movie_state.dart';
import 'package:the_movie_db/src/domain/use_cases/implementation/now_playing_use_case.dart';
import 'package:the_movie_db/src/domain/use_cases/implementation/popular_movies_use_case.dart';
import 'package:the_movie_db/src/domain/use_cases/implementation/top_rated_use_case.dart';
import 'package:the_movie_db/src/domain/use_cases/implementation/upcoming_movies_use_case.dart';
import 'package:the_movie_db/src/presentation/bloc/movies_bloc.dart';

class PMUseCaseMock extends Mock implements PopularMoviesUseCase {}

class UpcomingUseCaseMock extends Mock implements UpcomingMoviesUseCase {}

class TopRatedUseCaseMock extends Mock implements TopRatedUseCase {}

class NowPlayingUseCaseMock extends Mock implements NowPlayingUseCase {}

void main() {
  late PopularMoviesUseCase pmUseCaseMock;
  late UpcomingMoviesUseCase upcomingUseCaseMock;
  late TopRatedUseCase topRatedUseCaseMock;
  late NowPlayingUseCase nowPlayingUseCaseMock;

  setUp(() {
    pmUseCaseMock = PMUseCaseMock();
    upcomingUseCaseMock = UpcomingUseCaseMock();
    topRatedUseCaseMock = TopRatedUseCaseMock();
    nowPlayingUseCaseMock = NowPlayingUseCaseMock();
  });

  group('bloc testing', () {
    //TODO: pretty much the same for the rest of categories?
    test('should return a stream with popular movies data', () async* {
      MoviesBloc bloc = MoviesBloc(
          popularMoviesUseCase: pmUseCaseMock,
          topRatedMoviesUseCase: topRatedUseCaseMock,
          nowPlayingMoviesUseCase: nowPlayingUseCaseMock,
          upcomingMoviesUseCase: upcomingUseCaseMock
      );
      when(()=> pmUseCaseMock.call()).thenAnswer((_) => Future.value(SuccessState(MovieMocks().getMockedMovieList)));
      Stream stream = bloc.allMovies;
      expect(stream, emitsInOrder([MovieEvent(state: BaseState.success, data: MovieMocks().getMockedMovieList)]));
    });

  });
}
