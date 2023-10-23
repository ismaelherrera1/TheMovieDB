import 'package:flutter/material.dart';
import '../../core/util/ui_constants.dart';
import '../../data/repository_implementation/repository_implementation.dart';
import '../../domain/use_cases/implementation/now_playing_use_case.dart';
import '../../domain/use_cases/implementation/popular_movies_use_case.dart';
import '../../domain/use_cases/implementation/top_rated_use_case.dart';
import '../../domain/use_cases/implementation/upcoming_movies_use_case.dart';
import '../bloc/movies_bloc.dart';
import '../widgets/my_drawer.dart';
import '../widgets/nav_bar.dart';
import 'about_us_screen.dart';
import 'popular_movies_screen.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});
  final RemoteRepository repository = RemoteRepository();
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = PageController();
  int _selectedItem = 0;
  final _pages = [
    PopularMoviesScreen(
        bloc: MoviesBloc(
      popularMoviesUseCase:
          PopularMoviesUseCase(repository: RemoteRepository()),
      topRatedMoviesUseCase: TopRatedUseCase(
        repository: RemoteRepository(),
      ),
      nowPlayingMoviesUseCase:
          NowPlayingUseCase(repository: RemoteRepository()),
      upcomingMoviesUseCase:
          UpcomingMoviesUseCase(repository: RemoteRepository()),
    )),
    const AboutUsScreen()
  ];
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          UIConstants.movieAppTitle,
          style: TextStyle(
            fontFamily: 'Poppins',
            letterSpacing: UIConstants.titleLetterSpacing,
          ),
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
      )),
      body: PageView(
        controller: _controller,
        children: _pages,
        onPageChanged: (index) {
          setState(() {
            _selectedItem = index;
          });
        },
      ),
      bottomNavigationBar: NavBar(
        selectedItem: _selectedItem,
        controller: _controller,
      ),
    );
  }
}
