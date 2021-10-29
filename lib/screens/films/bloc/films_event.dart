part of 'films_bloc.dart';

abstract class FilmsEvent extends Equatable {
  const FilmsEvent();

  @override
  List<Object> get props => [];
}

class GetFilms extends FilmsEvent {
  const GetFilms();

  @override
  List<Object> get props => [];
}

class GetPagedFilms extends FilmsEvent {
  final int page;
  const GetPagedFilms({required this.page});

  @override
  List<Object> get props => [page];
}
