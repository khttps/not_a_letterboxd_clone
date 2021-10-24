import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'models.dart';

part 'review.g.dart';

@JsonSerializable(createToJson: false)
class Review extends Equatable {
  final int id;
  final String? text;
  final double? score;
  final Film film;
  final User user;

  const Review({
    required this.id,
    this.text,
    this.score,
    required this.film,
    required this.user,
  });

  factory Review.fromJson(Map<String, dynamic> json) => _$ReviewFromJson(json);

  @override
  List<Object?> get props => [
        id,
        text,
        score,
        film,
        user,
      ];
}
