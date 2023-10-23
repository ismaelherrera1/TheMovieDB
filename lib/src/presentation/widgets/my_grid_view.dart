import 'package:flutter/cupertino.dart';

import '../../core/util/ui_constants.dart';
import '../../data/model/movie_model.dart';
import 'movie_tile.dart';

class MyGridView extends StatelessWidget {
  const MyGridView({super.key, required this.snapshot});
  final List<MovieDataModel> snapshot;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(shrinkWrap: true,
      itemCount: UIConstants.gridViewItemCount,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: UIConstants.gridDelegateAxisCount,
        childAspectRatio: UIConstants.childAspectRatio,
      ),
      itemBuilder: (
          BuildContext context,
          int index,
          ) {
        return Padding(
          padding: const EdgeInsets.all(
            UIConstants.defaultPadding,
          ),
          child: MovieTile(
            movie: snapshot[index],
          ),
        );
      },
    );
  }
}
