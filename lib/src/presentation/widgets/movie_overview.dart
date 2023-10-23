import 'package:flutter/material.dart';
import '../../core/util/enum_states.dart';
import '../../core/util/genre_converter.dart';
import '../../core/util/ui_constants.dart';
import '../../core/util/widget_keys.dart';
import '../../domain/entities/genre.dart';
import 'genre_tile.dart';

class MovieOverview extends StatefulWidget {
  final Stream stream;
  final List<int> genresIds;
  final String overview;
  final String posterPath;
  final String releaseDate;

  const MovieOverview({
    required this.stream,
    required this.genresIds,
    required this.overview,
    required this.posterPath,
    required this.releaseDate,
    super.key,
  });
  static const posterHeight = 250.0;
  static const posterFit = BoxFit.fitWidth;
  static const genresSubtitle = 'Genres: ';
  static const releaseDateSubtitle = 'Release date: ';
  static const overviewSubtitle = 'Overview:';

  @override
  State<MovieOverview> createState() => _MovieOverviewState();
}

class _MovieOverviewState extends State<MovieOverview> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

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
                StreamBuilder(
                  key: const Key(
                    Keys.movieOverviewStreamBuilder,
                  ),
                  stream: widget.stream,
                  builder: (
                    BuildContext context,
                    AsyncSnapshot<dynamic> snapshot,
                  ) {
                    switch (snapshot.data?.state) {
                      case BaseState.success:
                        List<Genre> genres = GenreConverter().filterGenresById(
                          widget.genresIds,
                          snapshot.data!.genreList,
                        );
                        return Padding(
                          key: const Key(
                            Keys.movieOverviewPadding,
                          ),
                          padding: const EdgeInsets.all(
                            UIConstants.defaultPadding,
                          ),
                          child: SizedBox(
                            height: UIConstants.movieOverviewSizedBoxHeight,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: genres.length,
                              itemBuilder: (
                                BuildContext context,
                                int index,
                              ) {
                                return GenreTile(
                                  genre: genres[index],
                                  key: const Key(
                                    Keys.movieOverviewGenreTile,
                                  ),
                                );
                              },
                            ),
                          ),
                        );
                      case BaseState.empty:
                        return const Center(
                          child: Text(
                            UIConstants.emptyResponse,
                          ),
                        );
                      case BaseState.failure:
                        return snapshot.data!.error;
                      case BaseState.loading:
                        return snapshot.data!.loading;
                      default:
                        return const SizedBox();
                    }
                  },
                ),
                Text(
                  key: const Key(
                    Keys.movieOverviewDate,
                  ),
                  '${MovieOverview.releaseDateSubtitle} ${widget.releaseDate}',
                  style: const TextStyle(
                    decoration: TextDecoration.underline,
                  ),
                ),
                const Text(
                  MovieOverview.overviewSubtitle,
                  style: TextStyle(
                    fontSize: UIConstants.subtitleFontSize,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  key: const Key(
                    Keys.movieOverviewText,
                  ),
                  widget.overview,
                ),
              ],
            ),
          ),
          Image(
            key: const Key(
              Keys.movieOverviewPoster,
            ),
            image: NetworkImage(
              widget.posterPath,
            ),
            fit: MovieOverview.posterFit,
            height: MovieOverview.posterHeight,
          ),
        ],
      ),
    );
  }
}
