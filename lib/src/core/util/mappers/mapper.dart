import '../../../data/model/genre_model.dart';
import '../../../data/model/movie_model.dart';
import '../../../domain/entities/genre.dart';
import '../../../domain/entities/movie.dart';

class Mapper {
  Movie movieDataModelToMovie(MovieDataModel movieModel) {
    return Movie(
        adult: movieModel.adult,
        backdropPath: movieModel.backdropPath,
        genreIds: movieModel.genreIds,
        id: movieModel.id,
        originalLanguage: movieModel.originalLanguage,
        overview: movieModel.overview,
        popularity: movieModel.popularity,
        posterPath: movieModel.posterPath,
        releaseDate: movieModel.releaseDate,
        title: movieModel.title,
        video: movieModel.video,
        voteAverage: movieModel.voteAverage,
        voteCount: movieModel.voteCount);
  }

  Genre genreDataModelToGenre(GenreDataModel genreModel) {
    return Genre(
      id: genreModel.id,
      name: genreModel.name,
    );
  }
}
