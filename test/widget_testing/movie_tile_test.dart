import 'package:mocktail/mocktail.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:the_movie_db/src/domain/entities/movie.dart';
import 'package:the_movie_db/src/presentation/widgets/movie_tile.dart';

class MovieMock extends Mock implements Movie {}

void main() {
  testWidgets('display basic movie info in the movie tile widget',
      (WidgetTester tester) async {
    final Movie movie = Movie(
      adult: false,
      backdropPath: 'backdropPath',
      genreIds: [],
      id: 1,
      originalLanguage: 'en',
      overview: 'overview',
      popularity: 0,
      posterPath: 'posterPath',
      releaseDate: 'releaseDate',
      title: 'title',
      video: false,
      voteAverage: 0,
      voteCount: 1,
    );

    await mockNetworkImagesFor(() => tester.pumpWidget(MaterialApp(
          home: Scaffold(
            body: MovieTile(movie: movie),
          ),
        )));
    await tester.pump();

    expect(find.byKey(const Key('posterPathContainer')), findsOneWidget);
    expect(find.byKey(const Key('movieTitle')), findsOneWidget);
    expect(find.byKey(const Key('seeDetailsButton')), findsOneWidget);
  });
}
