import 'package:equatable/equatable.dart';
import 'models.dart';

class Filmlist extends Equatable {
  final int id;
  final String name;
  final String username;
  final String? description;
  final String? userAvatarUrl;
  final List<Film> films;

  const Filmlist({
    required this.id,
    required this.name,
    this.description,
    required this.username,
    this.userAvatarUrl,
    required this.films,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        description,
        username,
        userAvatarUrl,
        films,
      ];
}
