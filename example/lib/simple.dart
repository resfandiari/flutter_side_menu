import 'package:flutter/material.dart';
import 'package:flutter_side_menu/flutter_side_menu.dart';

const Color _selectedColor = Color(0xff0055c3);
const Color _unSelectedColor = Color(0xff8e8e8e);
void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
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
              builder: (data) {
                return SideMenuData(
                  header: const Text('Header'),
                  items: [
                    SideMenuItemDataTile(
                      isSelected: _currentIndex == 0,
                      onTap: () => setState(() => _currentIndex = 0),
                      title: 'Home',
                      icon: Icon(
                        Icons.home,
                        color: _currentIndex == 0
                            ? _selectedColor
                            : _unSelectedColor,
                      ),
                    ),
                    SideMenuItemDataTile(
                      isSelected: _currentIndex == 1,
                      onTap: () => setState(() => _currentIndex = 1),
                      title: 'Setting',
                      icon: Icon(
                        Icons.settings,
                        color: _currentIndex == 1
                            ? _selectedColor
                            : _unSelectedColor,
                      ),
                    ),
                  ],
                  footer: const Text('Footer'),
                );
              },
            ),
            Expanded(
              child: _currentIndex == 0 ? const Home() : const Setting(),
            ),
          ],
        ),
      ),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Home',
        style: Theme.of(context).textTheme.displaySmall,
      ),
    );
  }
}

class Setting extends StatelessWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Setting',
        style: Theme.of(context).textTheme.displaySmall,
      ),
    );
  }
}
