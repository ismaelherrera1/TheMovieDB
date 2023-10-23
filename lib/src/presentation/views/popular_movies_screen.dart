import 'package:flutter/material.dart';
import '../../core/util/enum_categories.dart';
import '../../core/util/enum_states.dart';
import '../../core/util/ui_constants.dart';
import '../bloc/movies_bloc.dart';
import '../widgets/my_grid_view.dart';

class PopularMoviesScreen extends StatefulWidget {
  late MoviesBloc bloc;
  PopularMoviesScreen({
    super.key,
    required this.bloc,
  });

  @override
  State<PopularMoviesScreen> createState() => _PopularMoviesScreenState();
}

class _PopularMoviesScreenState extends State<PopularMoviesScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    widget.bloc.getMovies(
      Categories.popular,
    );
    super.initState();
  }

  @override
  void dispose() {
    widget.bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Padding(
      padding: const EdgeInsets.all(
        UIConstants.moviesScreenPadding,
      ),
      child: StreamBuilder(
        stream: widget.bloc.allMovies,
        builder: (
          BuildContext context,
          AsyncSnapshot snapshot,
        ) {
          switch (snapshot.data?.state) {
            case BaseState.success:
              return MyGridView(
                snapshot: snapshot.data!.data!,
              );
            case BaseState.empty:
              return const Center(
                child: Text(
                  UIConstants.emptyResponse,
                ),
              );
            case BaseState.failure:
              return Center(
                child: Text(
                  snapshot.data!.error!,
                ),
              );
            case BaseState.loading:
              return const Center(
                child: CircularProgressIndicator(),
              );
            default:
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.red,
                ),
              );
          }
        },
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
