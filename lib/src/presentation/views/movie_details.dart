import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../domain/entities/movie.dart';
import '../../domain/use_cases/implementation/genres_use_case.dart';
import '../bloc/genres_bloc.dart';
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
  late final GenresBloc bloc;
  late final List<int> genresIds;


  @override
  void initState() {
    bloc = GenresBloc(useCase: GenresUseCase());
    bloc.getGenres();
    genresIds = widget.movie.genreIds;
    super.initState();
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
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
        title: Text(
          widget.movie.title,
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
              stream: bloc.allGenres,
              genresIds: widget.movie.genreIds,
              overview: widget.movie.overview,
              posterPath: widget.movie.fullPosterPath,
              releaseDate: widget.movie.releaseDate,
            ),
          ],
        ),
      ),
    );
  }
}
