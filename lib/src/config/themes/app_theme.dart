import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get light {
    return ThemeData(
      appBarTheme: const AppBarTheme(
        elevation: 0,
        color: Color.fromARGB(255, 255, 236, 67),
        foregroundColor: Colors.black,
      ),
      scaffoldBackgroundColor: const Color.fromARGB(255, 255, 245, 154),
      primaryColor: Colors.black,
      colorScheme: const ColorScheme.light(secondary: Colors.black),
      splashColor: Colors.transparent,
      fontFamily: 'IBM',
      textTheme: const TextTheme(
        // headline1: TextStyle(fontSize: 30),
        // headline2: TextStyle(fontSize: 30),
        // headline3: TextStyle(fontSize: 30),
        // headline4: TextStyle(fontSize: 30),
        // headline5: TextStyle(fontSize: 30),
        // headline6: TextStyle(fontSize: 30),
        // headlineLarge: TextStyle(fontSize: 30),
        // bodyText1: TextStyle(fontSize: 30),
        bodyText2: TextStyle(fontSize: 18),
        // caption: TextStyle(fontSize: 30),
        // button: TextStyle(fontSize: 30),
        // overline: TextStyle(fontSize: 30),
      ),
      cardTheme: const CardTheme(
        color: Color.fromARGB(255, 255, 236, 67),
        // elevation: 10,
        elevation: 3,
        margin: EdgeInsets.all(10),
        shape: RoundedRectangleBorder(),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
