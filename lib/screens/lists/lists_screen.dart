import 'package:flutter/material.dart';
import 'package:not_a_letterboxd_clone/models/models.dart';
import 'widgets/lists_item.dart';
import '../../widgets/widgets.dart';

class ListsScreen extends StatelessWidget {
  const ListsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainRefreshIndicator(
      onRefresh: () async {},
      child: ListView.separated(
        itemCount: 25,
        separatorBuilder: (c, i) => const Divider(thickness: 0.7, height: 0.0),
        itemBuilder: (context, index) {
          return ListsItem(
            list: _filmlist(index),
            onTap: () {},
          );
        },
      ),
    );
  }

  get _films => List.generate(
        20,
        (index) => Film(
          id: index,
          title: 'Dune',
          year: '2021',
          posterUrl: 'https://i.imgur.com/cEI8Ryc.jpeg',
        ),
      );

  _filmlist(int index) => Filmlist(
        id: index,
        name: 'My cool film list',
        description: 'This is a list by yours truly,'
            'it took me 6 hours to make,'
            'i hope you like it, thanks',
        username: 'Ahmed',
        userAvatarUrl: 'https://i.imgur.com/cEI8Ryc.jpeg',
        films: _films,
      );
}
