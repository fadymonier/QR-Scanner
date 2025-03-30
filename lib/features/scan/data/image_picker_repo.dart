import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:google_mlkit_barcode_scanning/google_mlkit_barcode_scanning.dart';

class ImagePickerRepository {
  final ImagePicker _picker = ImagePicker();
  final BarcodeScanner _barcodeScanner = BarcodeScanner();

  Future<String?> pickImageAndScanQR() async {
    try {
      print("📸 Opening gallery...");
      final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
      if (pickedFile == null) {
        print("❌ No image selected");
        return null;
      }

      print("🖼️ Image picked: ${pickedFile.path}");
      final inputImage = InputImage.fromFilePath(pickedFile.path);
      print("🔍 Processing image...");
      final barcodes = await _barcodeScanner.processImage(inputImage);

      await _barcodeScanner.close();

      if (barcodes.isNotEmpty && barcodes.first.rawValue != null) {
        print("✅ QR Code Found: ${barcodes.first.rawValue!}");
        return barcodes.first.rawValue!;
      }
      print("❌ No QR Code detected");
      return null;
    } catch (e) {
      print("⚠️ Error: $e");
      throw Exception("Failed to scan QR code from image");
    }
  }
}
