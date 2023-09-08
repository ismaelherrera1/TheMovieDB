import 'package:flutter/material.dart';
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
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(
              UIConstants.defaultPadding,
            ),
            height: UIConstants.tileHeight,
            alignment: Alignment.bottomLeft,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  movie.fullBackdropPath,
                ),
                fit: BoxFit.cover,
                opacity: UIConstants.tilesOpacity,
              ),
            ),
            child: Wrap(
              direction: Axis.vertical,
              spacing: UIConstants.tileElementsSpacing,
              children: [
                Text(
                  movie.title,
                  style: const TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: UIConstants.tileTitleFontsize,
                  ),
                ),
                TextButton(
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
                      fontFamily: 'Poppins',
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
