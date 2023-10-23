import 'package:flutter/material.dart';

import '../../core/util/enum_categories.dart';
import '../../core/util/enum_states.dart';
import '../../core/util/ui_constants.dart';
import '../../data/datasource/remote/movie_api_provider.dart';
import '../../data/repository_implementation/repository_implementation.dart';
import '../../domain/use_cases/implementation/now_playing_use_case.dart';
import '../../domain/use_cases/implementation/popular_movies_use_case.dart';
import '../../domain/use_cases/implementation/top_rated_use_case.dart';
import '../../domain/use_cases/implementation/upcoming_movies_use_case.dart';
import '../bloc/movies_bloc.dart';
import '../widgets/my_drawer.dart';
import '../widgets/my_grid_view.dart';

class NowPlayingMoviesScreen extends StatefulWidget {
  late MoviesBloc bloc;
  NowPlayingMoviesScreen({
    super.key,
    required this.bloc,
  });
  final MoviesApiProvider apiProvider = MoviesApiProvider();

  @override
  State<NowPlayingMoviesScreen> createState() => _NowPlayingMoviesScreenState();
}

class _NowPlayingMoviesScreenState extends State<NowPlayingMoviesScreen> {
  final String title = 'Now Playing movies';
  @override
  void initState() {
    widget.bloc.getMovies(
      Categories.now_playing,
    );
    super.initState();
  }

  @override
  void dispose() {
    widget.bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          title,
        ),
        centerTitle: true,
      ),
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
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(
          UIConstants.moviesScreenPadding,
        ),
        child: StreamBuilder(
          stream: widget.bloc.allMovies,
          builder: (
            BuildContext context,
            AsyncSnapshot snapshot,
          ) {
            switch (snapshot.data?.state) {
              case BaseState.success:
                return MyGridView(
                  snapshot: snapshot.data!.data!,
                );
              case BaseState.empty:
                return const Center(
                  child: Text(
                    UIConstants.emptyResponse,
                  ),
                );
              case BaseState.failure:
                return Center(
                  child: Text(
                    snapshot.data!.error!,
                  ),
                );
              case BaseState.loading:
                return const Center(
                  child: CircularProgressIndicator(),
                );
              default:
                return const Center(
                  child: CircularProgressIndicator(),
                );
            }
          },
        ),
      ),
    );
  }
}
