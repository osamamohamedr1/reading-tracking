import 'package:flutter/material.dart';

abstract class AppThemes {
  static ThemeData lightTheme = ThemeData(
    primaryColor: const Color(0xFF4A90E2),
    scaffoldBackgroundColor: const Color(0xFFF5F7FA),
    appBarTheme: const AppBarTheme(
      color: Colors.white,
      elevation: 0,
      iconTheme: IconThemeData(color: Color(0xFF4A90E2)),
      titleTextStyle: TextStyle(
        color: Color(0xFF0D1B2A),
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    drawerTheme: const DrawerThemeData(
      backgroundColor: Colors.white,
    ),
    iconTheme: const IconThemeData(color: Color(0xFF4A90E2)),
    listTileTheme: const ListTileThemeData(
      iconColor: Color(0xFF4A90E2),
      textColor: Color(0xFF0D1B2A),
      selectedTileColor: Color(0xFFE3F2FD),
      selectedColor: Color(0xFF1565C0),
      tileColor: Colors.white,
    ),
    brightness: Brightness.light,
    textTheme: const TextTheme().apply(
      displayColor: Color(0xFF0D1B2A),
      bodyColor: Color(0xFF0D1B2A),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    primaryColor: const Color(0xFF64B5F6),
    scaffoldBackgroundColor: const Color(0xFF121212),
    appBarTheme: const AppBarTheme(
      color: Color(0xFF1E1E1E),
      elevation: 0,
      iconTheme: IconThemeData(color: Color(0xFF64B5F6)),
      titleTextStyle: TextStyle(
        color: Color(0xFFECEFF1),
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    drawerTheme: const DrawerThemeData(
      backgroundColor: Color(0xFF1E1E1E),
    ),
    iconTheme: const IconThemeData(color: Color(0xFF64B5F6)),
    listTileTheme: const ListTileThemeData(
      iconColor: Color(0xFF64B5F6),
      textColor: Color(0xFFECEFF1),
      tileColor: Color(0xFF1E1E1E),
      selectedTileColor: Color(0xFF263238),
      selectedColor: Color(0xFF90CAF9),
    ),
    brightness: Brightness.dark,
    textTheme: const TextTheme().apply(
      displayColor: Color(0xFFECEFF1),
      bodyColor: Color(0xFFECEFF1),
    ),
  );
}
