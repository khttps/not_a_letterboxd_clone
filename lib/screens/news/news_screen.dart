import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:not_a_letterboxd_clone/core/palette.dart';
import '../blocs.dart';
import 'widgets/news_item.dart';
import '../../widgets/widgets.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainRefreshIndicator(
      onRefresh: () async => _loadNews(context),
      child: BlocConsumer<NewsBloc, NewsState>(
        listener: (context, state) {
          if (state is NewsError) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(state.message),
              backgroundColor: Palette.boxdOrange,
            ));
          }
        },
        builder: (context, state) {
          if (state is NewsLoading) {
            return const LoadingWidget();
          } else if (state is NewsLoaded) {
            return ListView.separated(
              itemCount: state.news.length,
              padding: const EdgeInsets.symmetric(
                vertical: 8.0,
                horizontal: 16.0,
              ),
              separatorBuilder: (c, i) => const SizedBox(height: 12.0),
              itemBuilder: (context, index) {
                return NewsItem(
                  news: state.news[index],
                  onTap: () {},
                );
              },
            );
          } else {
            return ListView(
              physics: const AlwaysScrollableScrollPhysics(),
            );
          }
        },
      ),
    );
  }

  void _loadNews(BuildContext context) =>
      BlocProvider.of<NewsBloc>(context).add(const LoadNews(page: 1));
}
