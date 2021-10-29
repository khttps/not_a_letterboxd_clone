import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import '../core/palette.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.75,
        color: Palette.scaffold,
        child: Drawer(
          child: ListView(
            children: [
              SizedBox(
                height: 100.0,
                child: Theme(
                  data: ThemeData(dividerColor: Colors.transparent),
                  child: DrawerHeader(
                    margin: const EdgeInsets.symmetric(horizontal: 48.0),
                    child: Image.asset('assets/images/drawer_header.png'),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              _DrawerItem(
                icon: Icons.layers_sharp,
                label: 'Popular',
                onTap: () {},
              ),
              _DrawerItem(
                icon: Icons.search_sharp,
                label: 'Search',
                onTap: () {},
              ),
              const Divider(color: Palette.darkGrey, height: 0.0),
              _DrawerItem(
                icon: MdiIcons.accountLock,
                label: 'Sign in',
                onTap: () {},
              ),
              _DrawerItem(
                icon: Icons.person_add_sharp,
                label: 'Create account',
                onTap: () {},
              ),
              _DrawerItem(
                icon: Icons.view_carousel_sharp,
                label: 'Open tour',
                onTap: () {},
              ),
              const Divider(color: Palette.darkGrey, height: 0.0),
              const ListTile(
                leading: Icon(Icons.add, color: Palette.scaffold),
                title: Text(
                  '1.0.0(0)',
                  style: TextStyle(
                    fontSize: 13.0,
                    color: Palette.text,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _DrawerItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final Function() onTap;
  const _DrawerItem({
    required this.icon,
    required this.label,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: true,
      leading: Icon(
        icon,
        color: Palette.border,
      ),
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
