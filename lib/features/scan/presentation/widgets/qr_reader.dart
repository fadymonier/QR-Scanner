// ignore_for_file: use_build_context_synchronously, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:qr_reader/core/utils/app_colors.dart';
import 'package:qr_reader/core/utils/app_text_styles.dart';
import 'package:qr_reader/features/scan/logic/qr_cubit/qr_scan_cubit.dart';

class QRScanScreen extends StatefulWidget {
  const QRScanScreen({super.key});

  @override
  State<QRScanScreen> createState() => _QRScanScreenState();
}

class _QRScanScreenState extends State<QRScanScreen> {
  late final MobileScannerController controller;
  String? scannedData;
  bool _isDisposed = false;
  bool _isScanning = true;

  @override
  void initState() {
    super.initState();
    controller = MobileScannerController(
      detectionSpeed: DetectionSpeed.normal,
      facing: CameraFacing.back,
      torchEnabled: false,
    );
  }

  @override
  void dispose() {
    _isDisposed = true;
    _safeDisposeCamera();
    super.dispose();
  }

  Future<void> _safeDisposeCamera() async {
    try {
      await controller.stop();
    } catch (e) {
      debugPrint('Error stopping camera: $e');
    } finally {
      controller.dispose();
    }
  }

  Future<void> _handleQRScan(String data) async {
    if (_isDisposed || !_isScanning) return;

    setState(() {
      scannedData = data;
      _isScanning = false;
    });

    await _safeDisposeCamera();

    context.read<QRScanCubit>().scanQRCode(data);

    Future.delayed(const Duration(milliseconds: 500), () {
      if (mounted) Navigator.pop(context, data);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Scan QR Code", style: AppTextStyles.inter24Black600),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 300.w,
              height: 300.h,
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.mainColor, width: 2),
                borderRadius: BorderRadius.circular(10),
              ),
              child:
                  _isScanning
                      ? MobileScanner(
                        controller: controller,
                        onDetect: (BarcodeCapture capture) {
                          print("QR Code Detected!");
                          if (capture.barcodes.isNotEmpty) {
                            final barcode = capture.barcodes.first;
                            if (barcode.rawValue != null) {
                              print("QR Data: ${barcode.rawValue}");
                              _handleQRScan(barcode.rawValue!);
                            }
                          }
                        },
                      )
                      : _buildSuccessWidget(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSuccessWidget() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.check_circle, color: Colors.green, size: 50),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              scannedData!,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            "QR Code scanned successfully!",
            style: TextStyle(color: Colors.green),
          ),
        ],
      ),
    );
  }
}
