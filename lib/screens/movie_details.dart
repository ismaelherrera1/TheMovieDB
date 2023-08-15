import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../widgets/movie.dart';
import '../widgets/movie_header.dart';
import '../utils/ui_constants.dart';
import '../widgets/movie_actions.dart';
import '../widgets/movie_overview.dart';

class MovieDetails extends StatelessWidget {
  final Movie movie;
  const MovieDetails(
    this.movie, {
    super.key,
  });
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
          onPressed: () {},
          icon: const Icon(Icons.arrow_back_ios_new),
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
              movie.title,
              movie.fullBackdropPath,
            ),
            MovieActions(
              movie.voteAverage,
              movie.voteCount,
            ),
            MovieOverview(
              movie.genreIds,
              movie.overview,
              movie.fullPosterPath,
              movie.releaseDate,
            ),
          ],
        ),
      ),
    );
  }
}
