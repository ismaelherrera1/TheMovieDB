import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../domain/entities/genre.dart';
import '../../data/repository_implementation/local_repository.dart';
import '../../domain/entities/movie.dart';
import '../widgets/movie_header.dart';
import '../../core/util/ui_constants.dart';
import '../widgets/movie_actions.dart';
import '../widgets/movie_overview.dart';

class MovieDetails extends StatefulWidget {
  final Movie movie;
  const MovieDetails({
    super.key,
    required this.movie,
  });

  @override
  State<MovieDetails> createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {
  final LocalRepository repository = LocalRepository();
  late final List<int> genresIds;
  late Future<List<Genre>> genresList;
  late final Future<List<String>> genresNames;
  @override
  void initState() {
    genresIds = widget.movie.genreIds;
    genresNames = repository.getGenresByMovie(genresIds);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.red.shade400,
        child: const Icon(
          Icons.movie_creation_rounded,
        ),
      ),
      appBar: AppBar(
        title: const Text(
          UIConstants.movieAppTitle,
        ),
        backgroundColor: CupertinoColors.darkBackgroundGray,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new,
          ),
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: const Icon(
              CupertinoIcons.question_circle,
            ),
          )
        ],
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(
              UIConstants.appBarRadiusBorder,
            ),
            bottomRight: Radius.circular(
              UIConstants.appBarRadiusBorder,
            ),
          ),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            MovieHeader(
              widget.movie.title,
              widget.movie.fullBackdropPath,
            ),
            MovieActions(
              widget.movie.voteAverage,
              widget.movie.voteCount,
            ),
            MovieOverview(
              genresNames,
              widget.movie.overview,
              widget.movie.fullPosterPath,
              widget.movie.releaseDate,
            ),
          ],
        ),
      ),
    );
  }
}
