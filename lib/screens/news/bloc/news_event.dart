part of 'news_bloc.dart';

abstract class NewsEvent extends Equatable {
  const NewsEvent();

  @override
  List<Object> get props => [];
}

class LoadNews extends NewsEvent {
  final int page;
  const LoadNews({required this.page});

  @override
  List<Object> get props => [page];
}
