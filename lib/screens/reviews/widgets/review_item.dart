import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:not_a_letterboxd_clone/core/palette.dart';
import 'package:not_a_letterboxd_clone/widgets/widgets.dart';

class ReviewItem extends StatelessWidget {
  final String title;
  final String year;
  final double score;
  final String? imageUrl;
  final String reviewText;
  final String user;
  final String? userAvatarUrl;
  final Function() onTap;
  const ReviewItem({
    required this.title,
    required this.year,
    required this.score,
    required this.reviewText,
    required this.user,
    this.imageUrl,
    this.userAvatarUrl,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 18.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Film title and year
              // width is half the screen so it wouldn't overlap
              // with the user info
              SizedBox(
                width: MediaQuery.of(context).size.width / 2,
                child: RichText(
                  text: TextSpan(
                    text: title,
                    style: const TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w600,
                    ),
                    children: [
                      TextSpan(
                        text: ' $year',
                        style: const TextStyle(
                          color: Palette.text,
                          fontSize: 14.0,
                          fontWeight: FontWeight.normal,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 2.0),
              // Stars generated based on review score
              Row(
                children: List.generate(
                  score.ceil(),
                  (index) => Icon(
                    (index + 1 - score == 0.5)
                        ? Icons.star_half_rounded
                        : Icons.star_rounded,
                    color: Palette.boxdGreen,
                    size: 14.0,
                  ),
                ),
              ),
              const SizedBox(height: 10.0),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 0.5,
                        color: Palette.border,
                      ),
                    ),
                    child: CachedNetworkImage(
                      imageUrl: imageUrl!,
                      width: 84.0,
                      height: 120.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 16.0),
                  Expanded(
                    child: Text(
                      reviewText,
                      style: const TextStyle(fontSize: 14.0, height: 1.2),
                      maxLines: 6,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Positioned(
          top: 12.0,
          right: 0.0,
          child: UserCard(
            user: user,
            avatarUrl: userAvatarUrl,
          ),
        ),
      ],
    );
  }
}
