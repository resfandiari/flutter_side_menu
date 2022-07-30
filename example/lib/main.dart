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
              body: SideMenuBodyData(
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
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.white,
                child: Center(
                  child: Text(
                    'body',
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                ),
              ),
            ),
            const SideMenu(
              position: SideMenuPosition.right,
              body: SideMenuBodyData(
                customChild: Text('custom view'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
