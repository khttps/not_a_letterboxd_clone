import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../models/models.dart';
import '../../../repositories/repositories.dart';
import '../../../data/exception/internet_exception.dart';

part 'films_event.dart';
part 'films_state.dart';

class FilmsBloc extends Bloc<FilmsEvent, FilmsState> {
  final BaseFilmRepository _repository;
  FilmsBloc({
    required BaseFilmRepository repository,
  })  : _repository = repository,
        super(FilmsInitial()) {
    on<FilmsEvent>(
      (event, emit) async {
        if (event is GetFilms) {
          emit(FilmsLoading());
          await _mapEventGetFilms(emit);
        }
        if (event is GetPagedFilms) {
          await _mapEventGetPagedFilms(emit, event.page);
        }
      },
    );
  }

  Future<void> _mapEventGetFilms(Emitter<FilmsState> emit) async {
    try {
      final collection = await _repository.getFilms(page: 1);
      emit(
        FilmsLoaded(
          films: collection.films,
          currentPage: collection.page,
          lastPage: collection.totalPages,
        ),
      );
    } on InternetException catch (err) {
      emit(FilmsError(message: err.message));
    } on Exception {
      emit(const FilmsError(message: 'Unknown error.'));
    }
  }

  Future<void> _mapEventGetPagedFilms(Emitter<FilmsState> emit, page) async {
    try {
      final collection = await _repository.getFilms(page: page);
      emit(
        FilmsLoaded(
          films: collection.films,
          currentPage: collection.page,
          lastPage: collection.totalPages,
        ),
      );
    } on Exception {
      emit(FilmsPageError());
    }
  }
}
