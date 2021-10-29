import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import '../core/palette.dart';

class MainDrawer extends StatelessWidget {
  final int selectedIndex;
  const MainDrawer({
    required this.selectedIndex,
    Key? key,
  }) : super(key: key);

  static const _options = {
    'Popular': MdiIcons.cards,
    'Search': Icons.search_sharp,
    'Sign in': MdiIcons.accountLock,
    'Create account': Icons.person_add_sharp,
    'Open tour': Icons.view_carousel_sharp,
  };

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.75,
        color: Palette.scaffold,
        child: Drawer(
          child: ListView.separated(
            itemCount: 2 + _options.length,
            shrinkWrap: true,
            separatorBuilder: (context, index) {
              if (index == 2 || index == 5) {
                return const Divider(color: Palette.primary, height: 0.0);
              }
              return const SizedBox(height: 10);
            },
            itemBuilder: (context, index) {
              if (index == 0) {
                return SizedBox(
                  height: 100.0,
                  child: Theme(
                    data: ThemeData(dividerColor: Colors.transparent),
                    child: DrawerHeader(
                      margin: const EdgeInsets.symmetric(horizontal: 48.0),
                      child: Image.asset('assets/images/drawer_header.png'),
                    ),
                  ),
                );
              }
              if (index == 6) {
                return const ListTile(
                  leading: Icon(Icons.add, color: Palette.scaffold),
                  title: Text(
                    '1.0.0(0)',
                    style: TextStyle(
                      fontSize: 13.0,
                      color: Palette.text,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                );
              }
              final entry = _options.entries.elementAt(index - 1);
              return _DrawerItem(
                  icon: entry.value,
                  label: entry.key,
                  selected: index - 1 == selectedIndex,
                  onTap: () {});
            },
          ),
        ),
      ),
    );
  }
}

class _DrawerItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool selected;
  final Function() onTap;
  const _DrawerItem({
    required this.icon,
    required this.label,
    this.selected = false,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: true,
      leading: Icon(
        icon,
        color: selected ? Colors.white : Palette.border,
      ),
      tileColor: selected ? Palette.primary : null,
      title: Text(
        label,
        style: const TextStyle(
          fontSize: 16.0,
          color: Colors.white,
          fontWeight: FontWeight.w400,
        ),
      ),
      onTap: onTap,
    );
  }
}
