import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../models/models.dart';
import '../../../repositories/filmlist_repository.dart';

part 'lists_event.dart';
part 'lists_state.dart';

class ListsBloc extends Bloc<ListsEvent, ListsState> {
  final BaseFilmlistRepository _repository;
  ListsBloc({required BaseFilmlistRepository repository})
      : _repository = repository,
        super(ListsInitial()) {
    on<ListsEvent>((event, emit) async {
      if (event is LoadLists) {
        emit(const ListsLoading());
        try {
          final lists = await _repository.getFilmlists(page: event.page);
          emit(ListsLoaded(lists: lists));
        } on Exception {
          emit(const ListsError(message: 'Couldn\'t load lists'));
        }
      }
    });
  }
}
