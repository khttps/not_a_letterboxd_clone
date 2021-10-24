import '../service/tmdb_service.dart';
import '../models/models.dart';

abstract class BaseFilmRepository {
  Future<List<Film>> getFilms({required int page});
}

class FilmRepository implements BaseFilmRepository {
  final BaseTMDBService _service;
  const FilmRepository({
    required BaseTMDBService service,
  }) : _service = service;

  @override
  Future<List<Film>> getFilms({required int page}) =>
      _service.getFilms(page: page);
}
