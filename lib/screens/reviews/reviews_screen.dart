import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/palette.dart';
import '../blocs.dart';
import 'widgets/review_item.dart';
import '../../widgets/widgets.dart';

class ReviewsScreen extends StatelessWidget {
  const ReviewsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainRefreshIndicator(
      onRefresh: () async => _loadReviews(context),
      child: BlocConsumer<ReviewsBloc, ReviewsState>(
        listener: (context, state) {
          if (state is ReviewsError) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(state.message),
              backgroundColor: Palette.boxdOrange,
            ));
          }
        },
        builder: (context, state) {
          if (state is ReviewsLoading) {
            return const LoadingWidget();
          } else if (state is ReviewsLoaded) {
            return ListView.separated(
              itemCount: state.reviews.length,
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              separatorBuilder: (c, i) => const Divider(
                thickness: 0.7,
                height: 0.0,
              ),
              itemBuilder: (context, index) {
                return ReviewItem(
                  review: state.reviews[index],
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

  void _loadReviews(BuildContext context) =>
      BlocProvider.of<ReviewsBloc>(context).add(const LoadReviews(page: 1));
}
