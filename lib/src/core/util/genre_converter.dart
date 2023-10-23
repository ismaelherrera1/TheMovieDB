import '../../domain/entities/genre.dart';

class GenreConverter {
  List<Genre> filterGenresById(List<int> ids, List<Genre> genres) {
    return ids
        .map((id) => genres.firstWhere((genre) => genre.id == id))
        .toList();
  }
}
