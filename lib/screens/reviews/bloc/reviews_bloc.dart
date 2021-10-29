import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:not_a_letterboxd_clone/models/models.dart';
import 'package:not_a_letterboxd_clone/repositories/repositories.dart';

part 'reviews_event.dart';
part 'reviews_state.dart';

class ReviewsBloc extends Bloc<ReviewsEvent, ReviewsState> {
  final BaseReviewRepository _repository;
  ReviewsBloc({required BaseReviewRepository repository})
      : _repository = repository,
        super(ReviewsInitial()) {
    on<ReviewsEvent>((event, emit) async {
      emit(const ReviewsLoading());
      if (event is LoadReviews) {
        try {
          final reviews = await _repository.getReviews(page: event.page);
          emit(ReviewsLoaded(reviews: reviews));
        } on Exception {
          emit(const ReviewsError(message: 'Couldn\'t load Reviews'));
        }
      }
    });
  }
}
