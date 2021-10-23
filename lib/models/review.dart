import 'package:equatable/equatable.dart';

import 'models.dart';

class Review extends Equatable {
  final int id;
  final String? text;
  final double? score;
  final Film film;
  final String username;
  final String? userAvatarUrl;

  const Review({
    required this.id,
    this.text,
    this.score,
    required this.film,
    required this.username,
    this.userAvatarUrl,
  });

  @override
  List<Object?> get props => [
        id,
        text,
        score,
        film,
        username,
        userAvatarUrl,
      ];
}
