import 'package:flutter/material.dart';
import '../../core/util/ui_constants.dart';

class MovieActions extends StatefulWidget {
  final double voteAverage;
  int voteCount;

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
    var likeCounterText = '${widget.voteCount} likes';
    if (widget.voteCount > 999) {
      likeCounterText = '+999 likes';
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
              likeCounterText,
              style: const TextStyle(
                fontSize: UIConstants.likeFontSize,
              ),
            ),
          ],
        ),
        Container(
          decoration: const ShapeDecoration(
            color: Colors.redAccent,
            shape: StarBorder(
              points: UIConstants.ratingStarPoints,
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
