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
              builder: (isOpen) {
                return SideMenuBodyData(
                  header: const Text('Header'),
                  items: [
                    SideMenuItemData(
                      isSelected: true,
                      onTap: () {},
                      title: 'Item 1',
                      icon: Icons.home,
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
              builder: (isOpen) => const SideMenuBodyData(
                customChild: Text('custom view'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
