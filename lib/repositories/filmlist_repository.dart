import 'dart:convert';

import 'package:flutter/services.dart';
import '../models/models.dart';

abstract class BaseFilmlistRepository {
  Future<List<Filmlist>> getFilmlists({required page});
}

class FilmlistRepository implements BaseFilmlistRepository {
  @override
  Future<List<Filmlist>> getFilmlists({required page}) async {
    final response = await rootBundle.loadString(
      'assets/data/filmlists.json',
    );
    final List<dynamic> filmlists = json.decode(response);
    return filmlists.map((e) => Filmlist.fromJson(e)).toList();
  }
}
