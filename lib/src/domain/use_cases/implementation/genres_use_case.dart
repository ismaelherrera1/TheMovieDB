import '../../../data/repository_implementation/repository_implementation.dart';
import '../usecase_interface/i_use_case.dart';
class GenresUseCase extends IUseCase{
  RemoteRepository repository = RemoteRepository();

  @override
  Future call({params}) {
    return repository.getGenres();
  }

}
