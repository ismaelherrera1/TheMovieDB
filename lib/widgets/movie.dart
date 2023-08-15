class Movie {
  final bool adult;
  final String backdropPath;
  final List<String> genreIds;
  final int id;
  final String originalLanguage;
  final String overview;
  final double popularity;
  final String posterPath;
  final String releaseDate;
  final String title;
  final bool video;
  final double voteAverage;
  final int voteCount;

  Movie({
    required this.adult,
    required this.backdropPath,
    required this.genreIds,
    required this.id,
    required this.originalLanguage,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.releaseDate,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });

  String get fullPosterPath => 'https://image.tmdb.org/t/p/w500/$posterPath';
  String get fullBackdropPath =>
      'https://image.tmdb.org/t/p/w500/$backdropPath';
}

class MovieFactory {
  static Movie movieSample() {
    return Movie(
      adult: false,
      backdropPath: '/9n2tJBplPbgR2ca05hS5CKXwP2c.jpg',
      genreIds: [
        "Animation",
        "Family",
        "Adventure",
        "Fantasy",
        "Comedy",
      ],
      id: 455476,
      originalLanguage: 'en',
      overview:
          'While working underground to fix a water main, Brooklyn plumbers—and brothers—Mario and Luigi are transported down a mysterious pipe and wander into a magical new world. But when the brothers are separated, Mario embarks on an epic quest to find Luigi.',
      popularity: 3963.447,
      posterPath: '/qNBAXBIQlnOThrVvA6mA2B5ggV6.jpg',
      releaseDate: '2023-04-27',
      title: 'The Super Mario Bros. Movie',
      video: false,
      voteAverage: 7.8,
      voteCount: 367,
    );
  }
}