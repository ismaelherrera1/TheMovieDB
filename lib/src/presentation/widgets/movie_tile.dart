import 'package:flutter/material.dart';
import '../../core/util/widget_keys.dart';
import '../views/movie_details.dart';
import '../../domain/entities/movie.dart';
import '../../core/util/ui_constants.dart';

class MovieTile extends StatelessWidget {
  const MovieTile({
    super.key,
    required this.movie,
  });
  final Movie movie;
  @override
  Widget build(
    BuildContext context,
  ) {
    return Column(
      children: [
        Expanded(
          child: Container(
            key: const Key(
              Keys.movieTilePosterPathContainer,
            ),
            padding: const EdgeInsets.all(
              UIConstants.defaultPadding,
            ),
            height: UIConstants.tileHeight,
            alignment: Alignment.bottomLeft,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  movie.fullPosterPath,
                ),
                fit: BoxFit.cover,
                opacity: UIConstants.tilesOpacity,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  key: const Key(
                    Keys.movieTileMovieTitle,
                  ),
                  movie.title,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontFamily: UIConstants.fontFamily,
                    fontSize: UIConstants.tileTitleFontsize,
                  ),
                ),
                TextButton(
                  key: const Key(
                    Keys.movieTileButton,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MovieDetails(
                          movie: movie,
                        ),
                      ),
                    );
                  },
                  style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll<Color>(
                      Colors.black,
                    ),
                  ),
                  child: const Text(
                    UIConstants.detailsTextButton,
                    style: TextStyle(
                      color: Colors.red,
                      fontFamily: UIConstants.fontFamily,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
