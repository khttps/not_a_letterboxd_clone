import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:not_a_letterboxd_clone/models/models.dart';
import 'package:not_a_letterboxd_clone/repositories/film_repository.dart';
import 'package:not_a_letterboxd_clone/service/exception/internet_exception.dart';

part 'films_event.dart';
part 'films_state.dart';

class FilmBloc extends Bloc<FilmsEvent, FilmsState> {
  final FilmRepository _repository;
  FilmBloc({
    required FilmRepository repository,
  })  : _repository = repository,
        super(FilmsInitial()) {
    on<FilmsEvent>((event, emit) async {
      if (event is GetFilms) {
        emit(FilmsLoading());
        await _mapEvent(emit);
      }
      if (event is GetPagedFilms) {
        emit(FilmsPageLoading());
        await _mapEvent(emit, page: event.page);
      }
    });
  }

  Future<void> _mapEvent(Emitter<FilmsState> emit, {int? page}) async {
    try {
      final films = await _repository.getFilms(page: page ?? 1);
      emit(FilmsLoaded(films: films));
    } on InternetException catch (err) {
      emit(FilmsError(message: err.message));
    } on Exception {
      emit(const FilmsError(message: 'Unknown error'));
    }
  }
}
