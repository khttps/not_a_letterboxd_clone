import 'package:not_a_letterboxd_clone/models/models.dart';

abstract class BaseNewsRepository {
  Future<List<News>> getNews({required int page});
}
