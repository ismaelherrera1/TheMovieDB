import 'package:flutter/material.dart';
import '../repositories/local_repository.dart';
import '../models/genre.dart';
import '../models/movie.dart';
import '../utils/ui_constants.dart';
import '../widgets/genre_tile.dart';
import '../widgets/movie_tile.dart';
import '../widgets/nav_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  LocalRepository localRepository = LocalRepository();
  late Future<List<Movie>> movies;
  late Future<List<Genre>> genres;
  @override
  void initState() {
    movies = localRepository.readMovieData();
    genres = localRepository.readGenreData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: UIConstants.genreScrollHeight,
            child: FutureBuilder(
              future: genres,
              builder: (
                BuildContext context,
                AsyncSnapshot snapshot,
              ) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text(snapshot.error.toString()),
                  );
                } else {
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: snapshot.data!.length,
                    itemBuilder: (
                      BuildContext context,
                      int index,
                    ) {
                      return Padding(
                        padding: const EdgeInsets.all(
                          UIConstants.defaultPadding,
                        ),
                        child: GenreTile(
                          genre: snapshot.data![index],
                        ),
                      );
                    },
                  );
                }
              },
            ),
          ),
          Expanded(
            child: FutureBuilder(
              future: movies,
              builder: (
                BuildContext context,
                AsyncSnapshot snapshot,
              ) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: snapshot.data!.length,
                    itemBuilder: (
                      BuildContext context,
                      int index,
                    ) {
                      return MovieTile(
                        movie: snapshot.data![index],
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: const NavBar(),
    );
  }
}
