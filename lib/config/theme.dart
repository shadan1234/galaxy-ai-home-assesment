import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../core/utils/constants.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark, // Enforce dark mode even in "light" theme slot
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.redAccent,
      brightness: Brightness.dark,
      background: Colors.black,
      surface: Colors.black,
    ),
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.black,
      elevation: 0,
      scrolledUnderElevation: 0,
      systemOverlayStyle: SystemUiOverlayStyle.light,
      iconTheme: IconThemeData(color: Colors.white),
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    ),
    cardTheme: CardThemeData(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppConstants.cardRadius),
      ),
      color: Colors.grey[900], 
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.black,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.grey,
    ),
    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: Colors.black,
      indicatorColor: Colors.white10, // Subtle indicator
      labelTextStyle: MaterialStateProperty.all(const TextStyle(color: Colors.white, fontSize: 12)),
      iconTheme: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.selected)) {
          return const IconThemeData(color: Colors.white);
        }
        return const IconThemeData(color: Colors.grey);
      }),
    )
  );

  static final ThemeData darkTheme = lightTheme; // Use same theme for both
}
