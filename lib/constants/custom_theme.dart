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
          fontWeight: FontWeight.w600,
        ),
      ),
      scaffoldBackgroundColor: Colors.grey[900],
      appBarTheme: AppBarTheme(
        toolbarHeight: 56,
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
      inputDecorationTheme: InputDecorationTheme(
          labelStyle: const TextStyle(color: Colors.grey, fontFamily: 'Nunito'),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(color: Colors.white),
          ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(color: Colors.white)),
          hintStyle: const TextStyle(color: Colors.white)),
      textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.all(10),
        backgroundColor: Colors.grey[900],
        foregroundColor: Colors.white,
        textStyle: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontFamily: 'Nunito',
            fontWeight: FontWeight.w600),
      )));
}
