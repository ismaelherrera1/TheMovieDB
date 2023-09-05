import 'package:flutter/material.dart';
import 'screens/home_page.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Colors.black,
        ),
      ),
      home: const Scaffold(
        body: SafeArea(
          child: Center(
            child: HomePage(),
          ),
        ),
      ),
    );
  }
}
