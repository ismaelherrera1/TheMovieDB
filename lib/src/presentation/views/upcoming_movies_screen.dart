import 'package:flutter/material.dart';

import '../../core/util/enum_categories.dart';
import '../../core/util/enum_states.dart';
import '../../core/util/ui_constants.dart';
import '../../data/repository_implementation/repository_implementation.dart';
import '../../domain/use_cases/implementation/now_playing_use_case.dart';
import '../../domain/use_cases/implementation/popular_movies_use_case.dart';
import '../../domain/use_cases/implementation/top_rated_use_case.dart';
import '../../domain/use_cases/implementation/upcoming_movies_use_case.dart';
import '../bloc/movies_bloc.dart';
import '../widgets/my_drawer.dart';
import '../widgets/my_grid_view.dart';

class UpComingMoviesScreen extends StatefulWidget {
  late MoviesBloc bloc;
  UpComingMoviesScreen({
    super.key,
    required this.bloc,
  });
  RemoteRepository repository = RemoteRepository();

  @override
  State<UpComingMoviesScreen> createState() => _UpComingMoviesScreenState();
}

class _UpComingMoviesScreenState extends State<UpComingMoviesScreen> {
  final String title = 'Upcoming movies';
  @override
  void initState() {
    widget.bloc.getMovies(
      Categories.upcoming,
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
            repository: widget.repository,
          ),
          topRatedMoviesUseCase: TopRatedUseCase(
            repository: widget.repository,
          ),
          nowPlayingMoviesUseCase: NowPlayingUseCase(
            repository: widget.repository,
          ),
          upcomingMoviesUseCase: UpcomingMoviesUseCase(
            repository: widget.repository,
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
