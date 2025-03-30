import 'package:flutter/material.dart';
import 'package:qr_reader/core/utils/app_colors.dart';
import 'package:qr_reader/core/widgets/custom_appbar.dart';
import 'package:qr_reader/features/scan/presentation/widgets/scan_screen_body.dart';

class ScanScreen extends StatelessWidget {
  const ScanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      appBar: CustomAppBar(),
      body: ScanScreenBody(),
    );
  }
}
