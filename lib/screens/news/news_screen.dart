import 'package:flutter/material.dart';
import 'widgets/news_item.dart';
import '../../widgets/widgets.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainRefreshIndicator(
      onRefresh: () async {},
      child: ListView.separated(
        itemCount: 25,
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        separatorBuilder: (c, i) => const SizedBox(height: 12.0),
        itemBuilder: (context, index) {
          return NewsItem(
            title: 'Breaking News',
            imageUrl: 'https://i.imgur.com/s6LDJvH.jpeg',
            description: 'Avatar ${index + 2} has been delayed, again',
          );
        },
      ),
    );
  }
}
