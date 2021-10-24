// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filmlist.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Filmlist _$FilmlistFromJson(Map<String, dynamic> json) => Filmlist(
      id: json['id'] as int,
      name: json['name'] as String,
      description: json['description'] as String?,
      user: User.fromJson(json['user'] as Map<String, dynamic>),
      films: (json['films'] as List<dynamic>)
          .map((e) => Film.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
