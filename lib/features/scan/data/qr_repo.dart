import 'package:hive/hive.dart';
import 'package:qr_reader/features/scan/data/qr_data_model.dart';

class QRRepository {
  static const String _boxName = "qr_codes";

  Future<void> saveQRData(String content) async {
    final box = Hive.box<QRDataModel>(_boxName);
    final exists = box.values.any((item) => item.content == content);
    if (!exists) {
      final qrData = QRDataModel(content: content, scannedAt: DateTime.now());
      await box.add(qrData);
    } else {}
  }

  List<QRDataModel> getAllQRData() {
    final box = Hive.box<QRDataModel>(_boxName);
    final data = box.values.toList();
    for (var item in data) {
      print("🔹 ${item.content} - ${item.scannedAt}");
    }
    return data;
  }

  Future<void> deleteQRData(int index) async {
    final box = Hive.box<QRDataModel>(_boxName);
    await box.deleteAt(index);
  }
}
