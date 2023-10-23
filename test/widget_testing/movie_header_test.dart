import 'package:flutter/material.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:the_movie_db/src/core/util/widget_keys.dart';
import 'package:the_movie_db/src/presentation/widgets/movie_header.dart';

void main() {
  testWidgets('Ensuring movie title and poster path are displayed correctly',
      (WidgetTester tester) async {
    const String title = 'title';
    const String backdropPath = 'backdropPath';

    await mockNetworkImagesFor(() => tester.pumpWidget(const MaterialApp(
          home: Scaffold(
            body: MovieHeader(title, backdropPath),
          ),
        )));
    await tester.pump();

    expect(find.byKey(const Key(Keys.movieTitle)), findsOneWidget);
    expect(find.byKey(const Key(Keys.backdropPath)), findsOneWidget);
  });
}
