import 'package:flutter/material.dart';
import '../screens.dart';
import '../../widgets/widgets.dart';

class PopularScreen extends StatefulWidget {
  const PopularScreen({Key? key}) : super(key: key);

  @override
  State<PopularScreen> createState() => _PopularScreenState();
}

class _PopularScreenState extends State<PopularScreen> {
  //int _selectedIndex = 0;

  final _tabs = const {
    'FILMS': FilmsScreen(),
    'REVIEWS': ReviewsScreen(),
    'LISTS': ListsScreen(),
    'NEWS': NewsScreen(),
  };

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _tabs.length,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Popular',
            style: TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {},
            ),
          ],
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(50.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: TabBar(
                isScrollable: true,
                tabs: _tabs.keys.map((e) => Tab(text: e)).toList(),
                indicatorPadding: EdgeInsets.zero,
                // onTap: (index) => setState(
                //   () => _selectedIndex = index,
                // ),
              ),
            ),
          ),
        ),
        drawer: const MainDrawer(selectedIndex: 0),
        body: TabBarView(
          // index: _selectedIndex,
          children: _tabs.values.toList(),
        ),
      ),
    );
  }
}
