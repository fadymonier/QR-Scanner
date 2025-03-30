import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
  final MobileScannerController controller = MobileScannerController();
  String? scannedData;
  bool isQRFixed = false;

  void _fixQRCode(String data) {
    setState(() {
      scannedData = data;
      isQRFixed = true;
    });
  }

  void _extractData() {
    if (isQRFixed && scannedData != null) {
      print("Extracting QR Data: $scannedData"); // ✅ طباعة البيانات قبل التخزين
      context.read<QRScanCubit>().scanQRCode(scannedData!);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("QR Data Saved Successfully!")),
      );
      Future.delayed(const Duration(seconds: 1), () {
        Navigator.pop(context);
      });
    }
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
              width: 250,
              height: 250,
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.mainColor, width: 2),
                borderRadius: BorderRadius.circular(10),
              ),
              child:
                  isQRFixed
                      ? const Center(
                        child: Text(
                          "QR Fixed",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                      : MobileScanner(
                        controller: controller,
                        onDetect: (BarcodeCapture capture) {
                          if (capture.barcodes.isNotEmpty) {
                            final barcode = capture.barcodes.first;
                            if (barcode.rawValue != null && !isQRFixed) {
                              _fixQRCode(barcode.rawValue!);
                            }
                          }
                        },
                      ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed:
                  isQRFixed ? null : () => setState(() => isQRFixed = true),
              child: const Text("Fix QR Code"),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: isQRFixed ? _extractData : null,
              child: const Text("Extract QR Data"),
            ),
          ],
        ),
      ),
    );
  }
}
