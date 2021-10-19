import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../widgets/widgets.dart';

class ListsItem extends StatelessWidget {
  final String listName;
  final String username;
  final String? userAvatarUrl;
  final List<String?> filmsPostersUrls;
  final String listDescription;
  final Function() onTap;
  const ListsItem({
    required this.listName,
    required this.username,
    this.userAvatarUrl,
    required this.filmsPostersUrls,
    required this.listDescription,
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
                  listName,
                  style: const TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                UserCard(user: username, avatarUrl: userAvatarUrl),
              ],
            ),
          ),
          const SizedBox(height: 10.0),
          _List(filmsPostersUrls: filmsPostersUrls),
          const SizedBox(height: 10.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              listDescription,
              style: const TextStyle(fontSize: 14.0, height: 1.2),
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
  final List<String?> filmsPostersUrls;
  const _List({
    required this.filmsPostersUrls,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 85.0,
      child: ListView.builder(
        itemCount: filmsPostersUrls.length,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        itemBuilder: (context, index) => CachedNetworkImage(
          imageUrl: filmsPostersUrls[index]!,
          width: 59.5,
          height: 85.0,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
