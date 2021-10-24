part of 'films_bloc.dart';

abstract class FilmsState extends Equatable {
  const FilmsState();

  @override
  List<Object> get props => [];
}

class FilmsInitial extends FilmsState {}

class FilmsLoading extends FilmsState {}

class FilmsPageLoading extends FilmsState {}

class FilmsLoaded extends FilmsState {
  final List<Film> films;
  const FilmsLoaded({required this.films});

  @override
  List<Object> get props => [films];
}

class FilmsError extends FilmsState {
  final String message;
  const FilmsError({required this.message});

  @override
  List<Object> get props => [message];
}
