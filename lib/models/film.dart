import 'package:equatable/equatable.dart';

class Film extends Equatable {
  final int id;
  final String title;
  final String year;
  final String? posterUrl;
  const Film({
    required this.id,
    required this.title,
    required this.year,
    this.posterUrl,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        posterUrl,
      ];
}
