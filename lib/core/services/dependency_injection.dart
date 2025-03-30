import 'package:get_it/get_it.dart';
import 'package:qr_reader/features/auth/login/logic/cubit/firebase_login_cubit.dart';
import 'package:qr_reader/features/auth/login/logic/firebase/firebase_auth_repository.dart';
import 'package:qr_reader/features/scan/data/image_picker_repo.dart';
import 'package:qr_reader/features/scan/data/qr_repo.dart';
import 'package:qr_reader/features/scan/logic/img_picker_cubit/image_picker_cubit.dart';
import 'package:qr_reader/features/scan/logic/qr_cubit/qr_scan_cubit.dart';

final GetIt sl = GetIt.instance;

void setupLocator() {
  // Login Feature
  sl.registerLazySingleton<FirebaseAuthRepository>(
    () => FirebaseAuthRepository(),
  );
  sl.registerLazySingleton<LoginCubit>(
    () => LoginCubit(sl<FirebaseAuthRepository>()),
  );
  // Scan Feature
  sl.registerLazySingleton<QRRepository>(() => QRRepository());
  sl.registerFactory<QRScanCubit>(() => QRScanCubit(sl<QRRepository>()));

  // Image Picker Feature
  sl.registerLazySingleton<ImagePickerRepository>(
    () => ImagePickerRepository(),
  );
  sl.registerFactory<ImagePickerCubit>(
    () => ImagePickerCubit(sl<ImagePickerRepository>(), sl<QRRepository>()),
  );
}
