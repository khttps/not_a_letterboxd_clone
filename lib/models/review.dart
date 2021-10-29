import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'models.dart';

part 'review.g.dart';

@JsonSerializable(createToJson: false)
class Review extends Equatable {
  final int id;
  final String? text;
  @JsonKey(fromJson: _fiveBasedScore)
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

  static double? _fiveBasedScore(double? score) {
    if (score != null) {
      return score / 2;
    }
  }

  @override
  List<Object?> get props => [
        id,
        text,
        score,
        film,
        user,
      ];
}
