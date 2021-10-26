import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:not_a_letterboxd_clone/core/palette.dart';
import '../../models/models.dart';
import '../../widgets/widgets.dart';
import '../blocs.dart';
import 'widgets/film_item.dart';

class FilmsScreen extends StatefulWidget {
  const FilmsScreen({Key? key}) : super(key: key);

  @override
  State<FilmsScreen> createState() => _FilmsScreenState();
}

class _FilmsScreenState extends State<FilmsScreen> {
  final _pagingController = PagingController<int, Film>(firstPageKey: 1);

  @override
  void initState() {
    _pagingController.addPageRequestListener(
      (pageKey) => _fetchFilmPage(pageKey),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MainRefreshIndicator(
      onRefresh: () async {
        _pagingController.refresh();
        _fetchFilms();
      },
      child: BlocConsumer<FilmsBloc, FilmsState>(
        listener: (context, state) {
          if (state is FilmsLoaded) {
            final films = state.films;
            final isLastPage = state.currentPage >= state.lastPage;
            if (isLastPage) {
              _pagingController.appendLastPage(films);
            } else {
              final nextPageKey = 1 + state.currentPage;
              _pagingController.appendPage(films, nextPageKey);
            }
          } else if (state is FilmsError) {
            _pagingController.error = state;
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(state.message),
              backgroundColor: Palette.boxdOrange,
            ));
          } else if (state is FilmsPageError) {
            _pagingController.error = state;
          }
        },
        builder: (context, state) {
          if (state is FilmsLoading) {
            return const LoadingWidget();
          } else if (state is FilmsError) {
            return ListView(
              physics: const AlwaysScrollableScrollPhysics(),
            );
          } else {
            return PagedGridView<int, Film>(
              pagingController: _pagingController,
              shrinkWrap: true,
              padding: const EdgeInsets.all(4.0),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                mainAxisSpacing: 4.0,
                crossAxisSpacing: 4.0,
                childAspectRatio: 0.7,
              ),
              builderDelegate: PagedChildBuilderDelegate(
                newPageProgressIndicatorBuilder: (c) => const LoadingWidget(),
                firstPageErrorIndicatorBuilder: (c) => const SizedBox.shrink(),
                newPageErrorIndicatorBuilder: (c) => const SizedBox.shrink(),
                firstPageProgressIndicatorBuilder: (c) => const LoadingWidget(),
                itemBuilder: (context, film, index) => FilmItem(
                  film: film,
                  onTap: () {},
                ),
              ),
            );
          }
        },
      ),
    );
  }

  void _fetchFilmPage(int page) =>
      BlocProvider.of<FilmsBloc>(context).add(GetPagedFilms(page: page));

  void _fetchFilms() =>
      BlocProvider.of<FilmsBloc>(context).add(const GetFilms());

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }
}
