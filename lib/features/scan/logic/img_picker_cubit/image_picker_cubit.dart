import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_reader/features/scan/data/image_picker_repo.dart';
import 'package:qr_reader/features/scan/data/qr_repo.dart';

part 'image_picker_state.dart';

class ImagePickerCubit extends Cubit<ImagePickerState> {
  final ImagePickerRepository imagePickerRepository;
  final QRRepository qrRepository; // ✅ استدعاء الريبو الخاص بالتخزين

  ImagePickerCubit(this.imagePickerRepository, this.qrRepository)
    : super(ImagePickerInitial());

  Future<void> pickImageAndScanQR() async {
    try {
      emit(ImagePickerLoading());

      final qrCode = await imagePickerRepository.pickImageAndScanQR();

      if (qrCode != null) {
        // ✅ حفظ الـ QR Code في نفس صندوق السكان
        await qrRepository.saveQRData(qrCode);

        emit(ImagePickerSuccess(qrCode));
        print("✅ QR Code from Image Saved: $qrCode");
      } else {
        emit(ImagePickerError("No QR code found in the image"));
        print("❌ No QR code detected in image");
      }
    } catch (e) {
      emit(ImagePickerError(e.toString()));
      print("⚠️ Error in ImagePickerCubit: $e");
    }
  }
}
