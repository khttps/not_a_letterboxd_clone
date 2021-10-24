import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'news.g.dart';

@JsonSerializable(createToJson: false)
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

  factory News.fromJson(Map<String, dynamic> json) => _$NewsFromJson(json);

  @override
  List<Object?> get props => [
        id,
        headline,
        description,
        imageUrl,
      ];
}
