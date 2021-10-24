import 'package:not_a_letterboxd_clone/models/models.dart';

abstract class BaseFilmlistRepository {
  Future<List<Filmlist>> getFilmlists({required page});
}

class FilmlistRepository implements BaseFilmlistRepository {
  @override
  Future<List<Filmlist>> getFilmlists({required page}) {
    throw UnimplementedError();
  }
}
