import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../utils/ui_constants.dart';

class MovieOverview extends StatelessWidget {
  final List<String> genreIds;
  final String overview;
  final String posterPath;
  final String releaseDate;

  const MovieOverview(
    this.genreIds,
    this.overview,
    this.posterPath,
    this.releaseDate, {
    super.key,
  });
  static const double posterHeight = 250;
  static const posterFit = BoxFit.fitWidth;
  static const String genresSubtitle = 'Genres: ';
  static const releaseDateSubtitle = 'Release date: ';
  static const overviewSubtitle = 'Overview:';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(
        UIConstants.defaultPadding,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: Wrap(
              children: [
                Text(
                  '$genresSubtitle $genreIds',
                  style: const TextStyle(
                    fontSize: UIConstants.genresFontSize,
                    fontFamily: 'Poppins',
                  ),
                ),
                Text(
                  '$releaseDateSubtitle $releaseDate',
                  style: const TextStyle(
                    decoration: TextDecoration.underline,
                  ),
                ),
                const Text(
                  overviewSubtitle,
                  style: TextStyle(
                    fontSize: UIConstants.subtitleFontSize,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  overview,
                ),
              ],
            ),
          ),
          Image(
            image: NetworkImage(posterPath),
            fit: posterFit,
            height: posterHeight,
          ),
        ],
      ),
    );
  }
}
