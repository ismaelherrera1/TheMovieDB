import 'package:flutter/material.dart';
import '../../core/util/ui_constants.dart';
import '../../core/util/widget_keys.dart';

class MovieActions extends StatefulWidget {
  final double voteAverage;
  int voteCount;
  String likesString = ' likes';
  String likesAbreviation = '+999 likes';

  MovieActions(
    this.voteAverage,
    this.voteCount, {
    super.key,
  });

  @override
  State<MovieActions> createState() => _MovieActionsState();
}

class _MovieActionsState extends State<MovieActions> {
  @override
  Widget build(BuildContext context) {
    double fontSize = 20;
    var movieRatingText = '${widget.voteAverage}';
    var likeCounterText = '${widget.voteCount} ${widget.likesString}';
    if (widget.voteCount > 999) {
      likeCounterText = widget.likesAbreviation;
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ButtonBar(
          children: <Widget>[
            ElevatedButton(
              onPressed: () {},
              child: const Icon(
                Icons.play_circle,
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Icon(
                Icons.save_alt,
              ),
            ),
            ElevatedButton(
              key: const Key(Keys.counterButton),
              onPressed: () {
                setState(() {
                  widget.voteCount++;
                });
              },
              child: const Icon(
                Icons.thumb_up,
              ),
            ),
            Text(
              key: const Key(Keys.likeCounterText),
              likeCounterText,
              style: const TextStyle(
                fontSize: UIConstants.likeFontSize,
              ),
            ),
          ],
        ),
        Container(
          key: const Key(Keys.voteStar),
          decoration: const ShapeDecoration(
            color: Colors.redAccent,
            shape: StarBorder(

            ),
          ),
          child: Text(
            movieRatingText,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: fontSize,
            ),
          ),
        ),
      ],
    );
  }
}
