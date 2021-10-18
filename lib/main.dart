import 'package:flutter/material.dart';
import 'package:not_a_letterboxd_clone/core/palette.dart';

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
        scaffoldBackgroundColor: Palette.scaffold,
        dividerColor: Palette.divider,
        appBarTheme: const AppBarTheme(backgroundColor: Palette.primary),
      ),
    );
  }
}
