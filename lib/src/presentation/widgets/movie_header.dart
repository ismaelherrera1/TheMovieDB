import 'package:flutter/cupertino.dart';
import '../../core/util/ui_constants.dart';

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
            backdropPath,
            fit: BoxFit.fitWidth,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(),
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
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
