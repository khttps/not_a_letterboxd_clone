import 'package:flutter/material.dart';
import 'package:not_a_letterboxd_clone/screens/lists/widgets/lists_item.dart';

class ListsScreen extends StatelessWidget {
  const ListsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 25,
      separatorBuilder: (c, i) => const Divider(thickness: 0.7, height: 0.0),
      itemBuilder: (context, index) {
        return ListsItem(
          listName: 'My cool film list',
          username: 'Ahmed',
          userAvatarUrl: 'https://i.imgur.com/cEI8Ryc.jpeg',
          filmsPostersUrls: List.generate(
            20,
            (index) => 'https://i.imgur.com/cEI8Ryc.jpeg',
          ),
          listDescription:
              'This is a list by yours truly, it took me 6 hours to make, i hope you like it, thanks',
          onTap: () {},
        );
      },
    );
  }
}
