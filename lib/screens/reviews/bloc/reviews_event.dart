part of 'reviews_bloc.dart';

abstract class ReviewsEvent extends Equatable {
  const ReviewsEvent();

  @override
  List<Object> get props => [];
}

class LoadReviews extends ReviewsEvent {
  final int page;
  const LoadReviews({required this.page});

  @override
  List<Object> get props => [page];
}
