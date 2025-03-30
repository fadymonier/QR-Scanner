import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_reader/features/scan/data/qr_repo.dart';

import 'qr_scan_state.dart';

class QRScanCubit extends Cubit<QRScanState> {
  final QRRepository qrRepository;

  QRScanCubit(this.qrRepository) : super(QRScanInitial());

  Future<void> scanQRCode(String content) async {
    try {
      emit(QRScanLoading());
      await qrRepository.saveQRData(content);

      final data = qrRepository.getAllQRData();
      emit(QRScanLoaded(data));
    } catch (e) {
      emit(QRScanError("Failed to save QR data"));
    }
  }

  Future<void> loadQRData() async {
    try {
      emit(QRScanLoading());
      final data = qrRepository.getAllQRData();
      emit(QRScanLoaded(data));
    } catch (e) {
      emit(QRScanError("Failed to load QR data"));
    }
  }

  Future<void> deleteQRItem(int index) async {
    try {
      emit(QRScanLoading());
      await qrRepository.deleteQRData(index);
      final data = qrRepository.getAllQRData();
      emit(QRScanLoaded(data));
    } catch (e) {
      emit(QRScanError("Failed to delete QR data"));
    }
  }
}
