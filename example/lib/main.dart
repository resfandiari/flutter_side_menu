import 'package:flutter/material.dart';
import 'package:flutter_side_menu/flutter_side_menu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _controller = SideMenuController();
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Row(
          children: [
            SideMenu(
              controller: _controller,
              backgroundColor: Colors.blueGrey,
              mode: SideMenuMode.open,
              builder: (data) {
                return SideMenuData(
                  header: const Text('Header'),
                  items: [
                    const SideMenuItemDataTitle(
                      title: 'Section Header'
                    ),
                    SideMenuItemDataTile(
                      isSelected: _currentIndex == 0,
                      onTap: () => setState(() => _currentIndex = 0),
                      title: 'Item 1',
                      hoverColor: Colors.blue,
                      titleStyle: const TextStyle(color: Colors.white),
                      icon: const Icon(Icons.home_outlined),
                      selectedIcon: const Icon(Icons.home),
                      badgeContent: const Text(
                        '23',
                        style: TextStyle(
                          fontSize: 8,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SideMenuItemDataTile(
                      isSelected: _currentIndex == 1,
                      onTap: () => setState(() => _currentIndex = 1),
                      title: 'Item 2',
                      selectedTitleStyle:
                          const TextStyle(fontWeight: FontWeight.w700,color: Colors.yellow),
                      icon: const Icon(Icons.table_bar_outlined),
                      selectedIcon: const Icon(Icons.table_bar),
                      titleStyle: const TextStyle(color: Colors.deepPurpleAccent),
                    ),
                    const SideMenuItemDataTitle(
                      title: 'Account',
                      textAlign: TextAlign.center,
                    ),
                    SideMenuItemDataTile(
                      isSelected: _currentIndex == 2,
                      onTap: () => setState(() => _currentIndex = 2),
                      title: 'Item 3',
                      icon: const Icon(Icons.play_arrow),
                    ),
                    SideMenuItemDataTile(
                      isSelected: _currentIndex == 3,
                      onTap: () => setState(() => _currentIndex = 3),
                      title: 'Item 4',
                      icon: const Icon(Icons.car_crash),
                    ),
                  ],
                  footer: const Text('Footer'),
                );
              },
            ),
            Expanded(
              child: Container(
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'body',
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        _controller.toggle();
                      },
                      child: const Text('change side menu state'),
                    )
                  ],
                ),
              ),
            ),
            SideMenu(
              position: SideMenuPosition.right,
              builder: (data) => const SideMenuData(
                customChild: Text('custom view'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
