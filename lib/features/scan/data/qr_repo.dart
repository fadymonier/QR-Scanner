import 'package:hive/hive.dart';
import 'package:qr_reader/features/scan/data/qr_data_model.dart';

class QRRepository {
  static const String _boxName = "qr_codes";

  Future<void> saveQRData(String content) async {
    final box = await Hive.openBox<QRDataModel>(_boxName);

    final exists = box.values.any((item) => item.content == content);
    if (!exists) {
      final qrData = QRDataModel(content: content, scannedAt: DateTime.now());
      await box.add(qrData);
    }
    await box.close();
  }

  Future<List<QRDataModel>> getAllQRData() async {
    final box = await Hive.openBox<QRDataModel>(_boxName);
    final data = box.values.toList();
    await box.close();
    return data;
  }

  Future<void> clearAllData() async {
    final box = await Hive.openBox<QRDataModel>(_boxName);
    await box.clear();
    await box.close();
  }
}
