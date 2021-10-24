import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:not_a_letterboxd_clone/data/tmdb_service.dart';

final sl = GetIt.instance;

void init() {
  //! Network
  sl.registerLazySingleton<BaseTMDBService>(
    () => TMDBService(client: sl(), connectionChecker: sl()),
  );
  sl.registerLazySingleton(() => Client());
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
