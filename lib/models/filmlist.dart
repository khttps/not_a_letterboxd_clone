import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'models.dart';

part 'filmlist.g.dart';

@JsonSerializable(createToJson: false)
class Filmlist extends Equatable {
  final int id;
  final String name;
  final String? description;
  final User user;
  final List<Film> films;

  const Filmlist({
    required this.id,
    required this.name,
    this.description,
    required this.user,
    required this.films,
  });

  factory Filmlist.fromJson(Map<String, dynamic> json) =>
      _$FilmlistFromJson(json);

  @override
  List<Object?> get props => [
        id,
        name,
        description,
        user,
        films,
      ];
}
