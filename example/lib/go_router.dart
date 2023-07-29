import 'package:flutter/material.dart';
import 'package:flutter_side_menu/flutter_side_menu.dart';
import 'package:go_router/go_router.dart';

const Color _selectedColor = Color(0xff0055c3);
const Color _unSelectedColor = Color(0xff8e8e8e);
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final _router = GoRouter(initialLocation: '/home', routes: [
    ShellRoute(
        builder: (context, state, child) => AppScaffold(child: child),
        routes: [
          GoRoute(
            path: '/home',
            builder: (context, state) => const Home(),
          ),
          GoRoute(
            path: '/setting',
            builder: (context, state) => const Setting(),
          )
        ]),
  ]);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      routerConfig: _router,
    );
  }
}

class AppScaffold extends StatelessWidget {
  const AppScaffold({
    super.key,
    required this.child,
  });
  final Widget child;
  @override
  Widget build(BuildContext context) {
    final selectedIndex = _calculateSelectedIndex(context);
    return Scaffold(
      body: Row(
        children: [
          SideMenu(
            builder: (data) {
              return SideMenuData(
                header: const Text('Header'),
                items: [
                  SideMenuItemDataTile(
                    isSelected: selectedIndex == 0,
                    onTap: () => _onItemTapped(0, context),
                    title: 'Home',
                    icon: Icon(
                      Icons.home,
                      color: selectedIndex == 0
                          ? _selectedColor
                          : _unSelectedColor,
                    ),
                  ),
                  SideMenuItemDataTile(
                    isSelected: selectedIndex == 1,
                    onTap: () => _onItemTapped(1, context),
                    title: 'Setting',
                    icon: Icon(
                      Icons.settings,
                      color: selectedIndex == 1
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
            child: child,
          ),
        ],
      ),
    );
  }

  void _onItemTapped(int index, BuildContext context) {
    switch (index) {
      case 0:
        GoRouter.of(context).go('/home');
        break;
      case 1:
        GoRouter.of(context).go('/setting');
        break;
    }
  }

  static int _calculateSelectedIndex(BuildContext context) {
    final String location = GoRouterState.of(context).uri.toString();
    if (location.startsWith('/home')) {
      return 0;
    }
    if (location.startsWith('/setting')) {
      return 1;
    }
    return 0;
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
