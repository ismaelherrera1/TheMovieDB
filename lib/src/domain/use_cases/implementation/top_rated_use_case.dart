import '../../../core/util/enum_categories.dart';
import '../../../data/repository_implementation/repository_implementation.dart';
import '../usecase_interface/i_use_case.dart';

class TopRatedUseCase implements IUseCase {
  final RemoteRepository repository;
  TopRatedUseCase({required this.repository});
  @override
  Future call({params}) {
    return repository.getMovies(Categories.top_rated);
  }
}
