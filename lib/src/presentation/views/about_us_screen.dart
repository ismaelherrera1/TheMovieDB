import 'package:flutter/material.dart';

import '../../core/util/ui_constants.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});
  static const String dummyText =
      'Looking for a comprehensive movie information app that fetches data from The Movie DB API? Look no further! Our app provides you with all the information you need about your favorite movies, from trailers and cast lists to reviews and ratings.';
  static const String aboutUsTitle = 'About the App';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              Text(
                aboutUsTitle,
                style: TextStyle(
                    fontSize: UIConstants.titleFontsize, fontFamily: 'Poppins'),
              ),
              Text(
                dummyText,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
