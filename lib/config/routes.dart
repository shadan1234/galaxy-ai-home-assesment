import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../domain/entities/pin.dart';
import '../../presentation/common/scaffold_with_navbar.dart';
import '../../presentation/feature_create/create_screen.dart';
import '../../presentation/feature_inbox/inbox_screen.dart';
import '../../presentation/feature_home/home_screen.dart';
import '../../presentation/feature_pin/pin_detail_screen.dart';
import '../../presentation/feature_profile/profile_screen.dart';
import '../../presentation/feature_search/search_screen.dart';

part 'routes.g.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> _shellNavigatorHomeKey = GlobalKey<NavigatorState>(debugLabel: 'shellHome');
final GlobalKey<NavigatorState> _shellNavigatorSearchKey = GlobalKey<NavigatorState>(debugLabel: 'shellSearch');
final GlobalKey<NavigatorState> _shellNavigatorProfileKey = GlobalKey<NavigatorState>(debugLabel: 'shellProfile');

final GlobalKey<NavigatorState> _shellNavigatorCreateKey = GlobalKey<NavigatorState>(debugLabel: 'shellCreate');
final GlobalKey<NavigatorState> _shellNavigatorInboxKey = GlobalKey<NavigatorState>(debugLabel: 'shellInbox');

@riverpod
GoRouter goRouter(GoRouterRef ref) {
  return GoRouter(
    initialLocation: '/home',
    navigatorKey: _rootNavigatorKey,
    debugLogDiagnostics: true,
    routes: [
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return ScaffoldWithNavBar(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            navigatorKey: _shellNavigatorHomeKey,
            routes: [
              GoRoute(
                path: '/home',
                builder: (context, state) => const HomeScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _shellNavigatorSearchKey,
            routes: [
              GoRoute(
                path: '/search',
                builder: (context, state) => const SearchScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _shellNavigatorCreateKey,
            routes: [
              GoRoute(
                path: '/create',
                builder: (context, state) => const CreateScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _shellNavigatorInboxKey,
            routes: [
              GoRoute(
                path: '/inbox',
                builder: (context, state) => const InboxScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _shellNavigatorProfileKey, // "Saved" tab
            routes: [
              GoRoute(
                path: '/profile',
                builder: (context, state) => const ProfileScreen(),
              ),
            ],
          ),
        ],
      ),
      GoRoute(
        path: '/pin/:id',
        parentNavigatorKey: _rootNavigatorKey, // Hide bottom nav on detail screen
        builder: (context, state) {
          final pin = state.extra as Pin;
          return PinDetailScreen(pin: pin);
        },
      ),
    ],
  );
}
