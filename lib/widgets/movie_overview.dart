import 'package:flutter/material.dart';
import '../utils/ui_constants.dart';

class MovieOverview extends StatelessWidget {
  final Future<List<String>> genres;
  final String overview;
  final String posterPath;
  final String releaseDate;

  const MovieOverview(
    this.genres,
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
                FutureBuilder(
                  future: genres,
                  builder: (
                    BuildContext context,
                    AsyncSnapshot<dynamic> snapshot,
                  ) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (snapshot.hasError) {
                      return Center(
                        child: Text(
                          snapshot.error.toString(),
                        ),
                      );
                    } else {
                      return Text(
                        '$genresSubtitle ${snapshot.data}',
                        style: const TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: UIConstants.genresFontSize,
                        ),
                      );
                    }
                  },
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
