part of 'films_bloc.dart';

abstract class FilmsState extends Equatable {
  const FilmsState();

  @override
  List<Object> get props => [];
}

class FilmsInitial extends FilmsState {}

class FilmsLoading extends FilmsState {}

class FilmsLoaded extends FilmsState {
  final List<Film> films;
  final int currentPage;
  final int lastPage;
  const FilmsLoaded({
    required this.films,
    required this.currentPage,
    required this.lastPage,
  });

  @override
  List<Object> get props => [films];
}

class FilmsPageError extends FilmsState {}

class FilmsError extends FilmsState {
  final String message;
  const FilmsError({required this.message});

  @override
  List<Object> get props => [message];
}
