import 'package:flutter/material.dart';
import 'package:qr_reader/features/auth/login/presentation/screen/login_screen.dart';
import 'package:qr_reader/features/scan/presentation/screen/scan_screen.dart';

class AppRouter {
  // Route names

  static const String login = "/Login";
  static const String forgetPassword = "/ForgetPassword";
  static const String scanScreen = "/ScanScreen";
  static const String qrResult = "/QrResult";

  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case scanScreen:
        return MaterialPageRoute(builder: (_) => const ScanScreen());

      default:
        return MaterialPageRoute(
          builder:
              (_) => Scaffold(
                body: Center(
                  child: Text('No route defined for ${settings.name}'),
                ),
              ),
        );
    }
  }
}
