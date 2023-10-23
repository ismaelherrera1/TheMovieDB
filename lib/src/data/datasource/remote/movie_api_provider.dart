import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import '../../../core/util/data_state.dart';
import '../../model/genre_model.dart';
import '../../model/genres_list_model.dart';
import '../../model/movie_list_model.dart';
import '../../model/movie_model.dart';

class MoviesApiProvider {
  final _genresUrl = 'https://api.themoviedb.org/3/genre/movie/list';
  final _auth =
      'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJmOTVkZGM3Zjg2NzY3YmFhMGU5NjA4MTIzMjA4MDg4YSIsInN1YiI6IjY1MTE3YjBjYTkxMTdmMDBjNGE5YWRjYyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.TUENAos3-bDCsPrdzLRldzzqVTpHhyrIYacfh4SBgTo';
  final _error = 'failed to fetch data';

  Future<DataState<List<MovieDataModel>>> fetchMovies(String url) async {
    final response = await http
        .get(Uri.parse(url), headers: {HttpHeaders.authorizationHeader: _auth});
    if (response.statusCode == HttpStatus.ok) {
      return SuccessState(
          MovieListModel.fromJson(json.decode(response.body)).results);
    } else {
      throw FailState(_error);
    }
  }

  Future<DataState<List<GenreDataModel>>> fetchGenres() async {
    final response = await http.get(Uri.parse(_genresUrl),
        headers: {HttpHeaders.authorizationHeader: _auth});
    if (response.statusCode == HttpStatus.ok) {
      return SuccessState(
        GenreListModel.fromJson(json.decode(response.body)).results);
    } else {
      throw FailState(_error);
    }
  }
}
