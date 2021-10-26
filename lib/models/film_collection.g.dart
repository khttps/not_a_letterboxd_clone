// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'film_collection.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FilmCollection _$FilmCollectionFromJson(Map<String, dynamic> json) =>
    FilmCollection(
      page: json['page'] as int,
      totalPages: json['total_pages'] as int,
      films: (json['results'] as List<dynamic>)
          .map((e) => Film.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
