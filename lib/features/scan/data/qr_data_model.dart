import 'package:hive/hive.dart';

part 'qr_data_model.g.dart';

@HiveType(typeId: 0)
class QRDataModel extends HiveObject {
  @HiveField(0)
  final String content;

  @HiveField(1)
  final DateTime scannedAt;

  QRDataModel({required this.content, required this.scannedAt});
}
