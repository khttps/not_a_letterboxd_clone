import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:not_a_letterboxd_clone/screens/blocs.dart';

import '../repositories/repositories.dart';
import '../service/tmdb_service.dart';

final sl = GetIt.instance;

void init() {
  //! Bloc
  sl.registerLazySingleton(() => FilmBloc(repository: sl()));
  //! Repository
  sl.registerLazySingleton<BaseFilmRepository>(
    () => FilmRepository(service: sl()),
  );
  sl.registerLazySingleton<BaseFilmlistRepository>(
    () => FilmlistRepository(),
  );
  sl.registerLazySingleton<BaseReviewRepository>(
    () => ReviewRepository(),
  );
  sl.registerLazySingleton<BaseNewsRepository>(
    () => NewsRepository(),
  );
  //! Network
  sl.registerLazySingleton<BaseTMDBService>(
    () => TMDBService(client: sl(), connectionChecker: sl()),
  );
  sl.registerLazySingleton(() => Client());
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
