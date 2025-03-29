// import 'package:flutter/material.dart';
// import 'package:mandoob/core/cache/cache_helper.dart';
// import 'package:mandoob/core/theme/app_theme.dart';

// class ThemeProvider extends ChangeNotifier {
//   // Initialize the theme from cached value
//   ThemeData _themeData = SharedPrefHelper.getBool('isDark', key: '') ?? false
//       ? darkTheme
//       : lightTheme;

//   ThemeData get themeData => _themeData;

//   bool get isDarkMode => _themeData == darkTheme;

//   // Setter to manually set the theme
//   set themeData(ThemeData themeData) {
//     _themeData = themeData;
//     notifyListeners();
//   }

//   // Toggle the theme and update the cache
//   void toggleTheme() {
//     if (_themeData == lightTheme) {
//       _themeData = darkTheme;
//     } else {
//       _themeData = lightTheme;
//     }
//     // Save the current theme to cache
//     SharedPrefHelper.saveBool(key: 'isDark', value: _themeData == darkTheme);
//     notifyListeners();
//   }
// }

// class CachedTheme with ChangeNotifier {
//   bool _isDark = SharedPrefHelper.getBool('isDark', key: '') ?? false;

//   bool get isDark => _isDark;

//   // Toggle the theme and update the cache
//   void toggleTheme() {
//     _isDark = !_isDark;
//     SharedPrefHelper.saveBool(key: 'isDark', value: _isDark);
//     notifyListeners();
//   }
// }
