import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../models/models.dart';
import '../../../repositories/repositories.dart';
part 'reviews_event.dart';
part 'reviews_state.dart';

class ReviewsBloc extends Bloc<ReviewsEvent, ReviewsState> {
  final BaseReviewRepository _repository;
  ReviewsBloc({required BaseReviewRepository repository})
      : _repository = repository,
        super(ReviewsInitial()) {
    on<ReviewsEvent>((event, emit) async {
      if (event is LoadReviews) {
        emit(const ReviewsLoading());
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
