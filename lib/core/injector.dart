import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:not_a_letterboxd_clone/service/tmdb_service.dart';
import 'package:not_a_letterboxd_clone/repositories/repositories.dart';

final sl = GetIt.instance;

void init() {
  //! Repository
  sl.registerLazySingleton<BaseFilmRepository>(
    () => FilmRepository(service: sl()),
  );
  //! Network
  sl.registerLazySingleton<BaseTMDBService>(
    () => TMDBService(client: sl(), connectionChecker: sl()),
  );
  sl.registerLazySingleton(() => Client());
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
