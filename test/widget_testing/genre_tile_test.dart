import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:the_movie_db/src/domain/entities/genre.dart';
import 'package:the_movie_db/src/presentation/widgets/genre_tile.dart';

void main(){
  testWidgets('render the genre tile correctly', (WidgetTester tester) async {
    Genre genre = Genre(id: 28, name: 'Action');

    await tester.pumpWidget(MaterialApp(home: GenreTile(genre: genre),));
    await tester.pump();

    expect(find.byKey(const Key('genreNameText')), findsOneWidget);
  });
}
