import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:the_movie_db/src/core/util/data_state.dart';
import 'package:the_movie_db/src/core/util/enum_categories.dart';
import 'package:the_movie_db/src/core/util/movie_related_mocks.dart';
import 'package:the_movie_db/src/data/datasource/remote/movie_api_provider.dart';
import 'package:the_movie_db/src/data/model/genres_list_model.dart';
import 'package:the_movie_db/src/data/model/movie_model.dart';
import 'package:the_movie_db/src/data/repository_implementation/repository_implementation.dart';
import 'package:the_movie_db/src/domain/entities/genre.dart';


class MockApiProvider extends Mock implements MoviesApiProvider{}

void main(){
  late MoviesApiProvider mockApiProvider;
  late RemoteRepository repository;

  setUp((){
    mockApiProvider = MockApiProvider();
    repository = RemoteRepository(apiProvider: mockApiProvider);
  });

  group('repository testing', () {
    test('should get DataState of popular movies', ()async{
      when(() => mockApiProvider.fetchMovies(any())).thenAnswer((_) async => SuccessState(MovieMocks().getMockedMovieList));
      final response = await repository.getMovies(Categories.popular);
      expect(response.data, isA<List<MovieDataModel>>());
    });

    test('should return List<Genre> DataState when getGenres invoked', ()async{
      when(() => mockApiProvider.fetchGenres()).thenAnswer((_) async => SuccessState(GenreMocks().getMockedGenreList));
      final response = await repository.getGenres();
      expect(response.data, isA<List<Genre>>());
    });

  });

}
