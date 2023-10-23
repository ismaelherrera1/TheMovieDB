import '../../domain/entities/movie.dart';

class MovieDataModel extends Movie {
  MovieDataModel({
    required super.posterPath,
    required super.adult,
    required super.genreIds,
    required super.overview,
    required super.releaseDate,
    required super.id,
    required super.originalLanguage,
    required super.title,
    required super.backdropPath,
    required super.voteCount,
    required super.video,
    required super.voteAverage,
    required super.popularity,
  });

  factory MovieDataModel.fromJson(Map<String, dynamic> json) {
    return MovieDataModel(
      posterPath: json['poster_path'],
      adult: json['adult'],
      genreIds: List<int>.from(json["genre_ids"]),
      overview: json['overview'],
      releaseDate: json['release_date'],
      id: json['id'],
      originalLanguage: json['original_language'],
      title: json['title'],
      backdropPath: json['backdrop_path'] ?? '',
      voteCount: json['vote_count'],
      video: json['video'],
      voteAverage: json['vote_average'].toDouble(),
      popularity: json['popularity'],
    );
  }
}
