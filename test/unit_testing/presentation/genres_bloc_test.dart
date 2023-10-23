import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:the_movie_db/src/core/util/data_state.dart';
import 'package:the_movie_db/src/core/util/enum_states.dart';
import 'package:the_movie_db/src/domain/entities/genre.dart';
import 'package:the_movie_db/src/domain/entities/genre_state.dart';
import 'package:the_movie_db/src/domain/use_cases/implementation/genres_use_case.dart';
import 'package:the_movie_db/src/presentation/bloc/genres_bloc.dart';

class GenresUseCaseMock extends Mock implements GenresUseCase{}
void main(){
  late GenresUseCase genresUseCaseMock;
  setUp(() {
    genresUseCaseMock = GenresUseCaseMock();
  });

  group('genres use case testing', (){
    test('should return genre data stream successfully', ()async*{
      GenresBloc bloc = GenresBloc(useCase: genresUseCaseMock);
      when(()=>genresUseCaseMock.call()).thenAnswer((_) => Future.value(DataState<List<Genre>>));
      Stream stream = bloc.allGenres;
      expect(stream, emitsInOrder([const GenresState(state: BaseState.success, genreList: [])]));
    });

    test('should return an error state due to data = null', ()async*{
      GenresBloc bloc = GenresBloc(useCase: genresUseCaseMock);
      when(()=>genresUseCaseMock.call()).thenAnswer((_) => Future.error(BaseState.failure));
      Stream stream = bloc.allGenres;
      expect(stream, emitsInOrder([const GenresState(state: BaseState.failure)]));
    });

  });
}
