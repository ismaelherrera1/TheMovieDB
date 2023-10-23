import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:the_movie_db/src/core/util/widget_keys.dart';
import 'package:the_movie_db/src/data/repository_implementation/repository_implementation.dart';
import 'package:the_movie_db/src/domain/use_cases/implementation/now_playing_use_case.dart';
import 'package:the_movie_db/src/domain/use_cases/implementation/popular_movies_use_case.dart';
import 'package:the_movie_db/src/domain/use_cases/implementation/top_rated_use_case.dart';
import 'package:the_movie_db/src/domain/use_cases/implementation/upcoming_movies_use_case.dart';
import 'package:the_movie_db/src/presentation/bloc/movies_bloc.dart';
import 'package:the_movie_db/src/presentation/widgets/my_drawer.dart';

void main() {
  testWidgets('checks if the drawer displays its information the right way',
      (WidgetTester tester) async {
    final scaffoldKey = GlobalKey<ScaffoldState>();
    await tester.pumpWidget(MaterialApp(
        home: Scaffold(
      key: scaffoldKey,
      drawer: MyDrawer(
          bloc: MoviesBloc(
        popularMoviesUseCase: PopularMoviesUseCase(
          repository: RemoteRepository(),
        ),
        topRatedMoviesUseCase: TopRatedUseCase(
          repository: RemoteRepository(),
        ),
        nowPlayingMoviesUseCase: NowPlayingUseCase(
          repository: RemoteRepository(),
        ),
        upcomingMoviesUseCase: UpcomingMoviesUseCase(
          repository: RemoteRepository(),
        ),
      )),
    )));
    scaffoldKey.currentState!.openDrawer();
    await tester.pumpAndSettle();
    expect(find.byType(Drawer), findsOneWidget);
    expect(find.byKey(const Key(Keys.drawerListView)), findsOneWidget);
    expect(find.byKey(const Key(Keys.drawerPopularMovies)), findsOneWidget);
    expect(find.byKey(const Key(Keys.drawerUpcomingMovies)), findsOneWidget);
    expect(find.byKey(const Key(Keys.drawerTopRatedMovies)), findsOneWidget);
    expect(find.byKey(const Key(Keys.drawerNowPlaying)), findsOneWidget);
  });
}
