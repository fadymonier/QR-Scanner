import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'img_picker_state.dart';

class ImgPickerCubit extends Cubit<ImgPickerState> {
  ImgPickerCubit() : super(ImgPickerInitial());
}
