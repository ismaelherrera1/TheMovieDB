import '../../core/util/data_state.dart';
import '../../core/util/enum_categories.dart';
import '../../data/model/movie_model.dart';

abstract class IRepository<T> {
  Future<DataState<List<MovieDataModel>>> getMovies(Categories category);
  Future<T> getGenres();
}
