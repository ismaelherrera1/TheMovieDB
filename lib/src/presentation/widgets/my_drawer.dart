import 'package:flutter/material.dart';

import '../../core/util/ui_constants.dart';
import '../../core/util/widget_keys.dart';
import '../bloc/movies_bloc.dart';
import '../views/home_page.dart';
import '../views/now_playing_movies_screen.dart';
import '../views/top_rated_movies_screen.dart';
import '../views/upcoming_movies_screen.dart';

class MyDrawer extends StatelessWidget {
  static const String title = 'Popular';
  static const String upComingTitle = 'Upcoming movies';
  static const String topRatedTitle = 'Top Rated movies';
  static const String nowPlayingTitle = 'Now Playing movies';
  late MoviesBloc bloc;
  MyDrawer({
    super.key,
    required this.bloc,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        key: const Key(
          Keys.drawerListView,
        ),
        children: [
          const DrawerHeader(
            child: Center(
              child: Text(
                UIConstants.movieAppTitle,
                style: TextStyle(
                  fontSize: UIConstants.titleFontsize,
                  letterSpacing: UIConstants.titleLetterSpacing,
                ),
              ),
            ),
          ),
          ListTile(
            key: const Key(
              Keys.drawerPopularMovies,
            ),
            leading: const Icon(
              Icons.star,
            ),
            title: const Text(
              title,
              style: TextStyle(
                fontSize: UIConstants.subtitleFontSize,
              ),
            ),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => HomePage(),
              ));
            },
          ),
          ListTile(
            key: const Key(
              Keys.drawerUpcomingMovies,
            ),
            leading: const Icon(
              Icons.fast_forward,
            ),
            title: const Text(
              upComingTitle,
              style: TextStyle(
                fontSize: UIConstants.subtitleFontSize,
              ),
            ),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => UpComingMoviesScreen(
                    bloc: bloc,
                  ),
                ),
              );
            },
          ),
          ListTile(
            key: const Key(
              Keys.drawerTopRatedMovies,
            ),
            leading: const Icon(
              Icons.local_fire_department,
            ),
            title: const Text(
              topRatedTitle,
              style: TextStyle(
                fontSize: UIConstants.subtitleFontSize,
              ),
            ),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => TopRatedMoviesScreen(
                    bloc: bloc,
                  ),
                ),
              );
            },
          ),
          ListTile(
            key: const Key(
              Keys.drawerNowPlaying,
            ),
            leading: const Icon(
              Icons.movie_filter,
            ),
            title: const Text(
              nowPlayingTitle,
              style: TextStyle(
                fontSize: UIConstants.subtitleFontSize,
              ),
            ),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => NowPlayingMoviesScreen(
                    bloc: bloc,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
