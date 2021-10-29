import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:not_a_letterboxd_clone/models/models.dart';
import 'package:not_a_letterboxd_clone/repositories/news_repository.dart';

part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final BaseNewsRepository _repository;
  NewsBloc({required BaseNewsRepository repository})
      : _repository = repository,
        super(NewsInitial()) {
    on<NewsEvent>((event, emit) async {
      if (event is LoadNews) {
        emit(const NewsLoading());
        try {
          final news = await _repository.getNews(page: event.page);
          emit(NewsLoaded(news: news));
        } on Exception {
          emit(const NewsError(message: 'Couldn\'t load news'));
        }
      }
    });
  }
}
