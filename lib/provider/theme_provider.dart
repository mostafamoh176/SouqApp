import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.light;

  bool get isDarkMode => themeMode == ThemeMode.dark;

  void toggleTheme(bool isOn) {
    themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}

class MyTheme {
  static final darkTheme =
  // ThemeData(

  //
  // );
  ThemeData(
    colorScheme: ColorScheme.dark(),
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Colors.grey.shade900,
    primarySwatch: Colors.grey,
    primaryColor: Colors.white,
    backgroundColor: const Color(0xFF212121),
    // accentColor: Colors.white,
    accentIconTheme: IconThemeData(color: Colors.white),
    dividerColor: Colors.black12,
    /* dark theme settings */
  );
  static final lighTheme = ThemeData(
    colorScheme: ColorScheme.light(),
    scaffoldBackgroundColor: Colors.white,
    primaryColor: Color(0xff746bc9),
    iconTheme: IconThemeData(color: Colors.black),
  );
}
