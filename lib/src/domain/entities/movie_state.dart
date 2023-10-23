import '../../core/util/enum_states.dart';
import 'movie.dart';

class MovieEvent {
  final BaseState state;
  final List<Movie>? data;
  final String? error;

  MovieEvent({
    required this.state,
    this.data,
    this.error,
  });
}
