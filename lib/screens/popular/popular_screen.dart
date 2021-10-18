import 'package:flutter/material.dart';

class PopularScreen extends StatefulWidget {
  const PopularScreen({Key? key}) : super(key: key);

  @override
  State<PopularScreen> createState() => _PopularScreenState();
}

class _PopularScreenState extends State<PopularScreen> {
  int _selectedIndex = 0;

  final _tabs = const {
    'FILMS': Scaffold(),
    'REVIEWS': Scaffold(),
    'LISTS': Scaffold(),
    'NEWS': Scaffold(),
  };

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _tabs.length,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Popular'),
          actions: [
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {},
            ),
          ],
          bottom: TabBar(
            tabs: _tabs.keys.map((e) => Tab(text: e)).toList(),
            indicatorPadding: EdgeInsets.zero,
            onTap: (index) => setState(
              () => _selectedIndex = index,
            ),
          ),
        ),
        drawer: const Drawer(),
        body: IndexedStack(
          index: _selectedIndex,
          children: _tabs.values.toList(),
        ),
      ),
    );
  }
}
