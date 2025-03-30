import 'package:equatable/equatable.dart';
import 'package:qr_reader/features/scan/data/qr_data_model.dart';

abstract class QRScanState extends Equatable {
  const QRScanState();

  @override
  List<Object> get props => [];
}

class QRScanInitial extends QRScanState {}

class QRScanLoading extends QRScanState {}

class QRScanLoaded extends QRScanState {
  final List<QRDataModel> qrData;

  const QRScanLoaded(this.qrData);

  @override
  List<Object> get props => [qrData];
}

class QRScanError extends QRScanState {
  final String message;

  const QRScanError(this.message);

  @override
  List<Object> get props => [message];
}
