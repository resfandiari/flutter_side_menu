import 'package:flutter/material.dart';
import 'package:flutter_side_menu/flutter_side_menu.dart';
import 'package:badges/badges.dart' as badges;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Filter Side',
      home: FilterSide(),
    );
  }
}

class FilterSide extends StatelessWidget {
  const FilterSide({Key? key}) : super(key: key);

  final _navItems = const [
    NavItemModel(name: 'Item 1', icon: Icons.home),
    NavItemModel(name: 'Item 2', icon: Icons.settings),
    NavItemModel(name: 'Item 3', icon: Icons.info),
  ];
  final _accountItems = const [
    NavItemModel(name: 'Item 4', icon: Icons.access_alarms_sharp),
    NavItemModel(name: 'Item 5', icon: Icons.accessibility_new_sharp),
    NavItemModel(name: 'Item 6', icon: Icons.ac_unit_sharp),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          body: Row(
            children: [
              Expanded(
                child: Container(
                  color: Colors.white,
                  alignment: Alignment.center,
                  child: Text(
                    'body',
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                ),
              ),
              VerticalDivider(
                width: 1,
                thickness: 1,
                color: Colors.grey.shade300,
              ),
              SideMenu(
                mode: SideMenuMode.open,
                position: SideMenuPosition.right,
                hasResizer: false,
                hasResizerToggle: false,
                builder: (data) {
                  return SideMenuData(
                    header: Column(
                      children: [
                        ListTile(
                          title: const Text('View Option',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold)),
                        ),
                        Container(
                          margin: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            border: Border.all(
                              color: Colors.grey.shade300,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: ListTile(
                            title: const Text('Default View'),
                          ),
                        ),
                        ListTile(
                          leading: const Icon(Icons.filter_alt_outlined),
                          title: const Text('Filter'),
                          trailing: const Icon(Icons.arrow_forward_ios),
                        ),
                        ListTile(
                          leading: const Icon(Icons.sort),
                          title: const Text('Sort'),
                          trailing: const Icon(Icons.arrow_forward_ios),
                        ),
                        ListTile(
                          leading: const Icon(Icons.access_alarm),
                          title: const Text('Alarm'),
                          trailing: const Icon(Icons.arrow_forward_ios),
                        ),
                        Divider()
                      ],
                    ),
                    items: [
                      ..._navItems
                          .map(
                            (e) => SideMenuItemDataTile(
                              isSelected: e.name == 'Item 1',
                              onTap: () {},
                              title: e.name,
                              icon: Icon(
                                e.icon,
                                color: const Color(0xff0055c3),
                              ),
                            ),
                          )
                          .toList(),
                      const SideMenuItemDataDivider(divider: Divider()),
                      const SideMenuItemDataTitle(title: 'Account'),
                      ..._accountItems
                          .map(
                            (e) => SideMenuItemDataTile(
                              isSelected: false,
                              onTap: () {},
                              title: e.name,
                              icon: Icon(
                                e.icon,
                                color: const Color(0xff8e8e8e),
                              ),
                              badgeBuilder: (tile) => badges.Badge(
                                badgeContent: const Center(
                                  child: Text(
                                    '23',
                                    style: TextStyle(
                                      fontSize: 8,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                position: badges.BadgePosition.custom(
                                  end: 12.0,
                                  bottom: 0.0,
                                  top: 0.0,
                                ),
                                child: tile,
                              ).showOrNull(data.isOpen),
                            ),
                          )
                          .toList(),
                    ],
                    footer: ListTile(
                      title: const Text('Foo Bar').showOrNull(data.isOpen),
                      subtitle: const Text('Foo Bar').showOrNull(data.isOpen),
                      leading: const Icon(Icons.person_pin),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

extension on Widget {
  Widget? showOrNull(bool isShow) => isShow ? this : null;
}

class NavItemModel {
  const NavItemModel({
    required this.name,
    required this.icon,
  });

  final String name;
  final IconData icon;
}
