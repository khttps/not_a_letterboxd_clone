import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../core/palette.dart';

class UserCard extends StatelessWidget {
  final String user;
  final String? avatarUrl;
  const UserCard({
    required this.user,
    this.avatarUrl,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          user,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            color: Palette.primary,
          ),
        ),
        const SizedBox(width: 8.0),
        CircleAvatar(
          radius: 16.0,
          backgroundColor: Palette.border,
          child: CircleAvatar(
            radius: 15.5,
            backgroundImage: CachedNetworkImageProvider(
              avatarUrl!,
            ),
          ),
        ),
      ],
    );
  }
}
