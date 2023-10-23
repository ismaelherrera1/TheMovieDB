import 'dart:async';

import '../../core/util/data_state.dart';
import '../../core/util/enum_states.dart';
import '../../domain/entities/genre_state.dart';
import '../../domain/use_cases/usecase_interface/i_use_case.dart';

import 'i_bloc.dart';

class GenresBloc implements IBloc{
  final IUseCase useCase;
  GenresBloc({required this.useCase});
  final _genres = StreamController<GenresState>.broadcast();
  Stream<GenresState> get allGenres => _genres.stream;

  @override
  void dispose() {
    _genres.close();
  }

  @override
  void initialize() {
    // TODO: implement initialize
  }

  void getGenres() async{
    _genres.sink.add(GenresState.loading());
    DataState genres = await useCase.call();
    _genres.sink.add(
        genres.data != null && genres.state == BaseState.success ?
        GenresState.success(genreList: genres.data) :
        GenresState.error(error: genres.error!)
    );
  }


}
