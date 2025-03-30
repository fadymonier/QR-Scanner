// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'qr_data_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class QRDataModelAdapter extends TypeAdapter<QRDataModel> {
  @override
  final int typeId = 0;

  @override
  QRDataModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return QRDataModel(
      content: fields[0] as String,
      scannedAt: fields[1] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, QRDataModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.content)
      ..writeByte(1)
      ..write(obj.scannedAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is QRDataModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
