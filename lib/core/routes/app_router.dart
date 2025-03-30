import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_reader/core/services/service_locator.dart';
import 'package:qr_reader/features/auth/login/presentation/screen/login_screen.dart';
import 'package:qr_reader/features/result/presentation/screen/result_screen.dart';
import 'package:qr_reader/features/scan/logic/qr_cubit/qr_scan_cubit.dart';
import 'package:qr_reader/features/scan/presentation/screen/scan_screen.dart';
import 'package:qr_reader/features/scan/presentation/widgets/qr_reader.dart';

class AppRouter {
  // Route names
  static const String login = "/";
  static const String forgetPassword = "/ForgetPassword";
  static const String scanScreen = "/ScanScreen";
  static const String qrScanner = "/QrScanner";
  static const String qrResult = "/QrResult";

  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case scanScreen:
        return MaterialPageRoute(builder: (_) => const ScanScreen());
      case qrScanner:
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider(
                create: (context) => sl<QRScanCubit>(),
                child: QRScanScreen(),
              ),
        );
      case qrResult:
        return MaterialPageRoute(builder: (_) => ResultScreen());

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
