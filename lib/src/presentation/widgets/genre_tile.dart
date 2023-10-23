import 'package:flutter/material.dart';
import '../../core/util/ui_constants.dart';
import '../../core/util/widget_keys.dart';
import '../../domain/entities/genre.dart';

class GenreTile extends StatelessWidget {
  const GenreTile({
    super.key,
    required this.genre,
  });
  final Genre genre;

  @override
  Widget build(BuildContext context) {
    return Container(
      key: const Key(Keys.genreTileContainer,),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          UIConstants.genresBorderRadius,
        ),
        color: Colors.red,
        boxShadow: const [
          BoxShadow(
            color: Colors.black87,
            spreadRadius: UIConstants.genresShadowSpread,
            blurRadius: UIConstants.genresBlurRadius,
            offset: Offset(
              UIConstants.genresOffsetDX,
              UIConstants.genresOffsetDY,
            ),
          )
        ],
      ),
      child: Text(
        key: const Key(Keys.genreTileNameText,),
        ' ${genre.name} ',
        style: const TextStyle(
          fontSize: UIConstants.genresFontSize,
        ),
      ),
    );
  }
}
