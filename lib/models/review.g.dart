// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Review _$ReviewFromJson(Map<String, dynamic> json) => Review(
      id: json['id'] as int,
      text: json['text'] as String?,
      score: (json['score'] as num?)?.toDouble(),
      film: Film.fromJson(json['film'] as Map<String, dynamic>),
      user: User.fromJson(json['user'] as Map<String, dynamic>),
    );
