import 'package:flutter/material.dart';

class PosterErrorWidget extends StatelessWidget {
  final String title;
  const PosterErrorWidget({
    required this.title,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        title,
        style: const TextStyle(fontSize: 10.0),
      ),
    );
  }
}
