part of 'films_bloc.dart';

abstract class FilmsEvent extends Equatable {
  const FilmsEvent();

  @override
  List<Object> get props => [];
}

class GetFilms implements FilmsEvent {
  const GetFilms();

  @override
  List<Object> get props => [];

  @override
  bool? get stringify => true;
}

class GetPagedFilms implements FilmsEvent {
  final int page;
  const GetPagedFilms({required this.page});

  @override
  List<Object> get props => [page];

  @override
  bool? get stringify => true;
}
