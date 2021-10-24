import 'package:not_a_letterboxd_clone/service/tmdb_service.dart';
import 'package:not_a_letterboxd_clone/models/models.dart';

abstract class BaseFilmRepository {
  Future<List<Film>> getFilms({required int page});
}

class FilmRepository implements BaseFilmRepository {
  final BaseTMDBService service;
  const FilmRepository({required this.service});

  @override
  Future<List<Film>> getFilms({required int page}) =>
      service.getFilms(page: page);
}
