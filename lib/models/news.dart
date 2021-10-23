import 'package:equatable/equatable.dart';

class News extends Equatable {
  final int id;
  final String headline;
  final String description;
  final String imageUrl;

  const News({
    required this.id,
    required this.headline,
    required this.description,
    required this.imageUrl,
  });

  @override
  List<Object?> get props => [
        id,
        headline,
        description,
        imageUrl,
      ];
}
