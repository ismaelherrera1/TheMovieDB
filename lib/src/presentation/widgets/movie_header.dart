import 'package:flutter/cupertino.dart';
import '../../core/util/ui_constants.dart';
import '../../core/util/widget_keys.dart';

class MovieHeader extends StatelessWidget {
  final String title;

  const MovieHeader(
    this.title,
    this.backdropPath, {
    super.key,
  });
  final String backdropPath;
  static const double backdropHeight = 270;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(),
          child: Image.network(
            key:const Key(Keys.backdropPath),
            backdropPath,
            fit: BoxFit.fitWidth,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(),
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              key:const Key(Keys.movieTitle),
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: UIConstants.titleFontsize,
                fontFamily: 'Poppins',
              ),
            ),
          ),
        ),
      ],
    );
  }
}
