import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:the_movie_db/src/core/util/data_state.dart';
import 'package:the_movie_db/src/core/util/enum_categories.dart';
import 'package:the_movie_db/src/core/util/movie_related_mocks.dart';
import 'package:the_movie_db/src/core/util/ui_constants.dart';
import 'package:the_movie_db/src/data/model/movie_model.dart';
import 'package:the_movie_db/src/data/repository_implementation/repository_implementation.dart';
import 'package:the_movie_db/src/domain/use_cases/implementation/popular_movies_use_case.dart';

class MockRemoteRepository extends Mock implements RemoteRepository{}

void main(){
  late PopularMoviesUseCase useCase;
  late MockRemoteRepository mockedRepo;
  setUp(() {
    mockedRepo = MockRemoteRepository();
    useCase = PopularMoviesUseCase(repository: mockedRepo);
  });
  group('Popular Movies Use Case works correctly', () {
    test('Use case call function getMovies works fine', () async {
      when(()=>mockedRepo.getMovies(Categories.popular)).thenAnswer((_) async => SuccessState(MovieMocks.mockedMovieList));
      await useCase.call();
      verify(()=>mockedRepo.getMovies(Categories.popular)).called(1);
    });

    test('Use case call method returns List<MovieDataModel> successfully ', () async{
      when(()=> mockedRepo.getMovies(Categories.popular)).thenAnswer((_) async => SuccessState(MovieMocks.mockedMovieList));
      DataState<List<MovieDataModel>> movies = await useCase.call();
      expect(movies, isA<SuccessState>());
      expect(movies.data, isNotEmpty);
      expect(movies.data?.first, isInstanceOf<MovieDataModel>());
    });

    test('call method receives a Fail State from repository', () async {
      when(()=>mockedRepo.getMovies(Categories.popular)).thenAnswer((_) async => FailState(UIConstants.errorMessage));
      try {
        DataState data = await mockedRepo.getMovies(Categories.popular);
        expect(data, isA<FailState>());
      } on Exception catch (e) {
        expect(e.toString(), UIConstants.errorMessage);
      }
    });

  });
}
