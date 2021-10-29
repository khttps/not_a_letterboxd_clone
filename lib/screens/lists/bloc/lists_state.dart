part of 'lists_bloc.dart';

abstract class ListsState extends Equatable {
  const ListsState();

  @override
  List<Object> get props => [];
}

class ListsInitial extends ListsState {}

class ListsLoading extends ListsState {
  const ListsLoading();
}

class ListsLoaded extends ListsState {
  final List<Filmlist> lists;
  const ListsLoaded({required this.lists});

  @override
  List<Object> get props => [lists];
}

class ListsError extends ListsState {
  final String message;
  const ListsError({required this.message});
  @override
  List<Object> get props => [message];
}
