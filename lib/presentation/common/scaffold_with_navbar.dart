import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ScaffoldWithNavBar extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const ScaffoldWithNavBar({
    required this.navigationShell,
    Key? key,
  }) : super(key: key ?? const ValueKey<String>('ScaffoldWithNavBar'));

  void _goBranch(int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: NavigationBar(
        selectedIndex: navigationShell.currentIndex,
        destinations: const [
          NavigationDestination(label: 'Home', icon: Icon(Icons.home_filled), selectedIcon: Icon(Icons.home_filled)),
          NavigationDestination(label: 'Search', icon: Icon(Icons.search), selectedIcon: Icon(Icons.search_rounded)),
          NavigationDestination(label: 'Create', icon: Icon(Icons.add_circle_outline), selectedIcon: Icon(Icons.add_circle)),
          NavigationDestination(label: 'Inbox', icon: Icon(Icons.chat_bubble_outline), selectedIcon: Icon(Icons.chat_bubble)),
          NavigationDestination(label: 'Saved', icon: Icon(Icons.person_outline), selectedIcon: Icon(Icons.person)),
        ],
        onDestinationSelected: _goBranch,
      ),
    );
  }
}
