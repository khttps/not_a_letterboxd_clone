part of 'news_bloc.dart';

abstract class NewsState extends Equatable {
  const NewsState();

  @override
  List<Object> get props => [];
}

class NewsInitial extends NewsState {}

class NewsLoading extends NewsState {
  const NewsLoading();
}

class NewsLoaded extends NewsState {
  final List<News> news;
  const NewsLoaded({required this.news});

  @override
  List<Object> get props => [news];
}

class NewsError extends NewsState {
  final String message;
  const NewsError({required this.message});

  @override
  List<Object> get props => [message];
}
