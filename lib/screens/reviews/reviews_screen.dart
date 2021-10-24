import 'package:flutter/material.dart';
import '../../models/models.dart';
import 'widgets/review_item.dart';
import '../../widgets/widgets.dart';

class ReviewsScreen extends StatelessWidget {
  const ReviewsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainRefreshIndicator(
      onRefresh: () async {},
      child: ListView.separated(
        itemCount: 25,
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        separatorBuilder: (c, i) => const Divider(thickness: 0.7, height: 0.0),
        itemBuilder: (context, index) {
          return ReviewItem(
            review: Review(
              id: index,
              film: Film(
                id: index,
                title: 'Dune',
                posterUrl: 'https://i.imgur.com/cEI8Ryc.jpeg',
                year: '2021',
              ),
              score: 3.5,
              user: const User(
                id: 1,
                username: 'Ahmed',
                avatarUrl: 'https://i.imgur.com/cEI8Ryc.jpeg',
              ),
              text: 'Dune is a movie starring people '
                  'and directed by person and i like it a lot '
                  'i give it a 4 out of 2 solid movie '
                  'really long review i hated this movie actually but whatever',
            ),
            onTap: () {},
          );
        },
      ),
    );
  }
}
