import 'package:flutter/material.dart';

extension NavigationExtensions on BuildContext {
  void navigateToReplacement(String routeName) {
    Navigator.pushReplacementNamed(this, routeName);
  }

  void navigateTo(String routeName) {
    Navigator.pushNamed(this, routeName);
  }

  void navigateBack() {
    Navigator.pop(this);
  }
}
