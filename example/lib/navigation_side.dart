import 'package:flutter/material.dart';
import 'package:flutter_side_menu/flutter_side_menu.dart';

class NavigationSide extends StatelessWidget {
  const NavigationSide({Key? key}) : super(key: key);

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
              SideMenu(
                builder: (data) {
                  return SideMenuData(
                    header: Column(
                      children: [
                        ListTile(
                          leading: const Icon(Icons.paypal),
                          title: const Text('PayPal').showOrNull(data.isOpen),
                          trailing:
                              const Icon(Icons.search).showOrNull(data.isOpen),
                        ),
                        if (data.isOpen)
                          const TabBar(
                            labelColor: Colors.black,
                            tabs: [
                              Tab(text: 'Tab 1'),
                              Tab(text: 'Tab 2'),
                            ],
                          )
                        else
                          Switch(value: false, onChanged: (vlaue) {})
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
                              badgeContent: const Text(
                                '23',
                                style: TextStyle(
                                  fontSize: 8,
                                  color: Colors.white,
                                ),
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
