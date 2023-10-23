import '../../../core/util/enum_categories.dart';
import '../../../data/repository_implementation/repository_implementation.dart';
import '../usecase_interface/i_use_case.dart';

class NowPlayingUseCase extends IUseCase {
  final RemoteRepository repository;
  NowPlayingUseCase({required this.repository});

  @override
  Future call({params}) {
    return repository.getMovies(Categories.now_playing);
  }
}
