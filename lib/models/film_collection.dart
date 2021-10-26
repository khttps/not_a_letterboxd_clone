import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'models.dart';

part 'film_collection.g.dart';

@JsonSerializable(createToJson: false)
class FilmCollection extends Equatable {
  final int page;
  @JsonKey(name: 'total_pages')
  final int totalPages;
  @JsonKey(name: 'results')
  final List<Film> films;

  const FilmCollection({
    required this.page,
    required this.totalPages,
    required this.films,
  });

  factory FilmCollection.fromJson(Map<String, dynamic> json) =>
      _$FilmCollectionFromJson(json);

  @override
  List<Object?> get props => [totalPages, films];
}
