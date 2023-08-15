import 'package:flutter/material.dart';
import 'screens/movie_details.dart';
import 'widgets/movie.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Movie marioMovie = MovieFactory.movieSample();
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Colors.red,
        ),
      ),
      home: Scaffold(
        body: SafeArea(
          child: Center(
            child: MovieDetails(marioMovie),
          ),
        ),
      ),
    );
  }
}
