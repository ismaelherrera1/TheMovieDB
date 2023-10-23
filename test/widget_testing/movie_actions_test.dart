import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:the_movie_db/src/core/util/widget_keys.dart';
import 'package:the_movie_db/src/presentation/widgets/movie_actions.dart';

void main() {
  String expectedLikes = '101 likes';
  testWidgets('Ensure that like button works correctly',
      (WidgetTester tester) async {
    const double voteAverage = 7.0;
    const int voteCount = 100;

    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: MovieActions(voteAverage, voteCount),
      ),
    ));
    await tester.tap(find.byKey(const Key(Keys.counterButton)));
    await tester.pumpAndSettle();

    expect(find.byKey(const Key(Keys.counterButton)), findsOneWidget);
    expect(find.byKey(const Key(Keys.likeCounterText)), findsOneWidget);
    expect(find.byKey(const Key(Keys.voteStar)), findsOneWidget);
    expect(find.text(expectedLikes), findsOneWidget);
  });
}
