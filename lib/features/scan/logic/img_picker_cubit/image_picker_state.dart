part of 'image_picker_cubit.dart';

abstract class ImagePickerState {}

class ImagePickerInitial extends ImagePickerState {}

class ImagePickerLoading extends ImagePickerState {}

class ImagePickerSuccess extends ImagePickerState {
  final String qrCode;
  ImagePickerSuccess(this.qrCode);
}

class ImagePickerError extends ImagePickerState {
  final String message;
  ImagePickerError(this.message);
}
