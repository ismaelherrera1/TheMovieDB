import '../../data/model/genre_model.dart';
import '../../data/model/movie_model.dart';
import '../../domain/entities/movie.dart';

class MovieMocks {
  static const Map<String, dynamic> mockedResponse = {
    "results": [
      {
        "adult": false,
        "backdrop_path": "/1syW9SNna38rSl9fnXwc9fP7POW.jpg",
        "genre_ids": [28, 878, 12],
        "id": 565770,
        "original_language": "en",
        "original_title": "Blue Beetle",
        "overview": "Recent college grad Jaime Reyes returns home "
            "full of aspirations for his future,"
            "only to find that home is not quite as he left it. "
            "As he searches to find his purpose in the world,"
            "fate intervenes when Jaime unexpectedly finds "
            "himself in possession of an ancient relic of alien biotechnology:"
            "the Scarab.",
        "popularity": 2972.534,
        "poster_path": "/mXLOHHc1Zeuwsl4xYKjKh2280oL.jpg",
        "release_date": "2023-08-16",
        "title": "Blue Beetle",
        "video": false,
        "vote_average": 7.2,
        "vote_count": 956,
      },
    ],
  };
  static const Map<String, dynamic> emptyResponse = {};

  static MovieDataModel mockedMovie = MovieDataModel(
    adult: false,
    backdropPath: '/1syW9SNna38rSl9fnXwc9fP7POW.jpg',
    genreIds: [28, 878, 12],
    id: 565770,
    originalLanguage: "en",
    overview: "Recent college grad Jaime Reyes returns home "
        "full of aspirations for his future,"
        "only to find that home is not quite as he left it. "
        "As he searches to find his purpose in the world,"
        "fate intervenes when Jaime unexpectedly finds "
        "himself in possession of an ancient relic of alien biotechnology:"
        "the Scarab.",
    popularity: 2972.534,
    posterPath: "/mXLOHHc1Zeuwsl4xYKjKh2280oL.jpg",
    releaseDate: "2023-08-16",
    title: "Blue Beetle",
    video: false,
    voteAverage: 7.2,
    voteCount: 956,
  );

  static final List<MovieDataModel> mockedMovieList = [
    mockedMovie,
  ];
  List<MovieDataModel> get getMockedMovieList => mockedMovieList;

  static const List<Movie> emptyMovieList = [];
}

class GenreMocks{
  static GenreDataModel mockedGenre = GenreDataModel(id: 1, name: 'name',);
  static final List<GenreDataModel> mockedGenreList = [mockedGenre];
  List<GenreDataModel> get getMockedGenreList => mockedGenreList;
}
