import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../models/models.dart';
import '../core/palette.dart';

class UserCard extends StatelessWidget {
  final User user;

  const UserCard({
    required this.user,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          user.username,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            color: Palette.primary,
          ),
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
        const SizedBox(width: 8.0),
        CircleAvatar(
          radius: 16.0,
          backgroundColor: Palette.border,
          child: CircleAvatar(
            radius: 15.5,
            backgroundImage: CachedNetworkImageProvider(
              user.avatarUrl!,
            ),
          ),
        ),
      ],
    );
  }
}
