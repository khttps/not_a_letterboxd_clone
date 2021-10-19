import 'package:flutter/material.dart';
import 'core/palette.dart';
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
          bodyText2: TextStyle(
            color: Palette.text,
            fontWeight: FontWeight.w300,
          ),
        ),
        tabBarTheme: const TabBarTheme(
          labelPadding: EdgeInsets.symmetric(horizontal: 14.0),
          labelStyle: TextStyle(fontWeight: FontWeight.w500),
          unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w500),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Palette.primary,
        ),
      ),
      home: const PopularScreen(),
    );
  }
}
