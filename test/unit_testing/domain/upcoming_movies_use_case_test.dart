
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:the_movie_db/src/core/util/data_state.dart';
import 'package:the_movie_db/src/core/util/enum_categories.dart';
import 'package:the_movie_db/src/core/util/movie_related_mocks.dart';
import 'package:the_movie_db/src/core/util/ui_constants.dart';
import 'package:the_movie_db/src/data/model/movie_model.dart';
import 'package:the_movie_db/src/data/repository_implementation/repository_implementation.dart';
import 'package:the_movie_db/src/domain/use_cases/implementation/upcoming_movies_use_case.dart';
class MockRemoteRepository extends Mock implements RemoteRepository{}

void main(){
  late UpcomingMoviesUseCase useCase;
  late MockRemoteRepository mockedRepo;
  setUp(() {
    mockedRepo = MockRemoteRepository();
    useCase = UpcomingMoviesUseCase(repository: mockedRepo);
  });

  group('Upcoming movies use case works correctly', (){
    test('Use case call function getMovies works appropriately', ()async {
      when(()=>mockedRepo.getMovies(Categories.upcoming)).thenAnswer((_) async => SuccessState(MovieMocks.mockedMovieList));
      await useCase.call();
      verify(()=>mockedRepo.getMovies(Categories.upcoming)).called(1);
    });

    test('Use case call method returns List<MovieDataModel> successfully ', ()async{
      when(()=>mockedRepo.getMovies(Categories.upcoming)).thenAnswer((_)async => SuccessState(MovieMocks.mockedMovieList));
      DataState<List<MovieDataModel>> movies = await useCase.call();
      expect(movies, isA<SuccessState>());
      expect(movies.data, isNotEmpty);
      expect(movies.data?.first, isInstanceOf<MovieDataModel>());
    });

    test('call method receives a FailState from repository', () async {
      when(()=>mockedRepo.getMovies(Categories.upcoming)).thenAnswer((_) async => FailState(UIConstants.errorMessage));
      try{
        DataState data = await mockedRepo.getMovies(Categories.upcoming);
        expect(data, isA<FailState>());
      }on Exception catch (e){
        expect(e.toString(), UIConstants.errorMessage);
      }
    });
  });
}
