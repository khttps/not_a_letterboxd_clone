import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'film.g.dart';

@JsonSerializable()
class Film extends Equatable {
  final int id;
  final String title;
  @JsonKey(name: 'release_date', fromJson: _extractYear)
  final String year;
  @JsonKey(name: 'poster_path', fromJson: _addBaseUrl)
  final String? posterUrl;
  const Film({
    required this.id,
    required this.title,
    required this.year,
    this.posterUrl,
  });

  static String _extractYear(String year) =>
      year.substring(0, year.indexOf('-'));
  static String _addBaseUrl(String path) =>
      'https://image.tmdb.org/t/p/w185$path';

  factory Film.fromJson(Map<String, dynamic> json) => _$FilmFromJson(json);

  @override
  List<Object?> get props => [
        id,
        title,
        posterUrl,
      ];
}
