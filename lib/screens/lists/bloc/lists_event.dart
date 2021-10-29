part of 'lists_bloc.dart';

abstract class ListsEvent extends Equatable {
  const ListsEvent();

  @override
  List<Object> get props => [];
}

class LoadLists extends ListsEvent {
  final int page;
  const LoadLists({required this.page});

  @override
  List<Object> get props => [page];
}
