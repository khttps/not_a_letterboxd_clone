import 'package:flutter/material.dart';
import 'package:not_a_letterboxd_clone/core/palette.dart';
import 'screens/screens.dart';

void main() {
  runApp(const NotLetterboxdApp());
}

class NotLetterboxdApp extends StatelessWidget {
  const NotLetterboxdApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Not Letterboxd',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Graphik',
        scaffoldBackgroundColor: Palette.scaffold,
        dividerColor: Palette.divider,
        indicatorColor: Palette.boxdGreen,
        canvasColor: Palette.scaffold,
        textTheme: const TextTheme(
          bodyText2: TextStyle(color: Palette.text, fontFamily: 'Graphik'),
        ),
        tabBarTheme: const TabBarTheme(
          labelPadding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 14.0),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Palette.primary,
        ),
      ),
      home: const PopularScreen(),
    );
  }
}
