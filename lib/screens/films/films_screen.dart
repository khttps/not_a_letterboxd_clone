import 'package:flutter/material.dart';
import '../../widgets/widgets.dart';
import 'widgets/film_item.dart';

class FilmsScreen extends StatelessWidget {
  const FilmsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainRefreshIndicator(
      onRefresh: () async {},
      child: GridView.builder(
        itemCount: 25,
        shrinkWrap: true,
        padding: const EdgeInsets.all(4.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          mainAxisSpacing: 4.0,
          crossAxisSpacing: 4.0,
          childAspectRatio: 0.7,
        ),
        itemBuilder: (BuildContext context, int index) {
          return FilmItem(
            imageUrl: 'https://i.imgur.com/cEI8Ryc.jpeg',
            onTap: () {},
          );
        },
      ),
    );
  }
}
