import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:not_a_letterboxd_clone/core/palette.dart';
import '../blocs.dart';
import 'widgets/lists_item.dart';
import '../../widgets/widgets.dart';

class ListsScreen extends StatelessWidget {
  const ListsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainRefreshIndicator(
      onRefresh: () async {},
      child: BlocConsumer<ListsBloc, ListsState>(
        listener: (context, state) {
          if (state is ListsError) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(state.message),
              backgroundColor: Palette.boxdOrange,
            ));
          }
        },
        builder: (context, state) {
          if (state is ListsLoading) {
            return const LoadingWidget();
          } else if (state is ListsLoaded) {
            return ListView.separated(
              itemCount: state.lists.length,
              separatorBuilder: (c, i) =>
                  const Divider(thickness: 0.8, height: 0.0),
              itemBuilder: (context, index) {
                return ListsItem(
                  list: state.lists[index],
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
}
