import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:not_a_letterboxd_clone/widgets/widgets.dart';
import '/models/models.dart';
import '../../../core/palette.dart';

class FilmItem extends StatelessWidget {
  final Film film;
  final Function() onTap;
  const FilmItem({
    required this.film,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            width: 0.5,
            color: Palette.border,
          ),
        ),
        child: CachedNetworkImage(
          imageUrl: film.posterUrl ?? '',
          errorWidget: (c, u, e) => PosterErrorWidget(title: film.title),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
