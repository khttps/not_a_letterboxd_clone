import 'package:flutter/material.dart';
import 'package:not_a_letterboxd_clone/screens/reviews/widgets/review_item.dart';

class ReviewsScreen extends StatelessWidget {
  const ReviewsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 25,
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      separatorBuilder: (c, i) => const Divider(thickness: 0.7, height: 0.0),
      itemBuilder: (context, index) {
        return ReviewItem(
          title: 'Dune',
          imageUrl: 'https://i.imgur.com/cEI8Ryc.jpeg',
          year: '2021',
          score: 3.5,
          userAvatarUrl: 'https://i.imgur.com/cEI8Ryc.jpeg',
          reviewText:
              'Dune is a movie starring people and directed by person and i like it a lot i give it a 4 out of 2 solid movie really long review i hated this movie actually but whatever',
          user: 'Ahmed Khattab',
          onTap: () {},
        );
      },
    );
  }
}
