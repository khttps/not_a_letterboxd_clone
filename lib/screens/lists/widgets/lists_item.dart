import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '/models/models.dart';
import '../../../widgets/widgets.dart';

class ListsItem extends StatelessWidget {
  final Filmlist list;
  final Function() onTap;
  const ListsItem({
    required this.list,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  list.name,
                  style: const TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                UserCard(user: list.user),
              ],
            ),
          ),
          const SizedBox(height: 10.0),
          _List(films: list.films),
          const SizedBox(height: 10.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              list.description ?? '',
              style: const TextStyle(
                fontSize: 13.0,
                height: 1.7,
                fontWeight: FontWeight.w400,
              ),
              maxLines: 7,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}

class _List extends StatelessWidget {
  final List<Film> films;
  const _List({
    required this.films,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 85.0,
      child: ListView.builder(
        itemCount: films.length,
        addRepaintBoundaries: false,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        itemBuilder: (context, index) => CachedNetworkImage(
          imageUrl: films[index].posterUrl!,
          errorWidget: (i, c, e) => PosterErrorWidget(
            title: films[index].title,
          ),
          width: 59.5,
          height: 85.0,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
