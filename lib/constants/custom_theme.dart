import 'package:flutter/material.dart';

class CustomTheme {
  final ThemeData customThemeData = ThemeData(
    primarySwatch: Colors.grey,
    iconTheme: const IconThemeData(
      color: Colors.white,
      fill: 0,
    ),
    textTheme: const TextTheme(
      titleMedium: TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontFamily: 'Nunito',
          fontWeight: FontWeight.w600),
    ),
    scaffoldBackgroundColor: Colors.grey[900],
    appBarTheme: AppBarTheme(
      foregroundColor: Colors.white,
      elevation: 0,
      titleTextStyle: const TextStyle(
          fontFamily: "Nunito",
          fontWeight: FontWeight.bold,
          color: Colors.white,
          fontSize: 20),
      backgroundColor: Colors.grey[800],
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.grey[800],
      unselectedItemColor: Colors.grey,
      showSelectedLabels: true,
      showUnselectedLabels: false,
      elevation: 0,
      type: BottomNavigationBarType.shifting,
      enableFeedback: false,
    ),
  );
}
