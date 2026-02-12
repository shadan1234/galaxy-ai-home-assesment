import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'config/routes.dart';
import 'config/theme.dart';

import 'package:clerk_flutter/clerk_flutter.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await dotenv.load(fileName: ".env");
  } catch (e) {
    debugPrint("Failed to load .env file: $e");
    // Fallback or handle error appropriately, maybe set default env vars or show a warning dialog later
  }
  
  runApp(const ProviderScope(child: PinterestApp()));
}

class PinterestApp extends ConsumerWidget {
  const PinterestApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final clerkKey = dotenv.env['NEXT_PUBLIC_CLERK_PUBLISHABLE_KEY'];

    if (clerkKey == null || clerkKey.isEmpty) {
      return MaterialApp(
        home: Scaffold(
          body: Center(
            child: Text(
              'Error: Clerk Publishable Key not found.\nPlease check your .env file.',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.red, fontSize: 18),
            ),
          ),
        ),
      );
    }

    return ClerkAuth(
      config: ClerkAuthConfig(
        publishableKey: clerkKey,
      ),
      child: Builder(builder: (context) {
        return MaterialApp.router(
          title: 'Pinterest Clone',
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: ThemeMode.dark,
          routerConfig: GoRouter(
            navigatorKey: GlobalKey<NavigatorState>(),
            initialLocation: '/home',
            refreshListenable: ClerkAuth.of(context),
            redirect: (context, state) {
              final authState = ClerkAuth.of(context);
              final signedIn = authState.user != null;
              final isLoggingIn = state.uri.toString() == '/auth';

              if (!signedIn && !isLoggingIn) return '/auth';
              if (signedIn && isLoggingIn) return '/home';

              return null;
            },
            routes: appRoutes,
          ),
          debugShowCheckedModeBanner: false,
        );
      }),
    );
  }
}
