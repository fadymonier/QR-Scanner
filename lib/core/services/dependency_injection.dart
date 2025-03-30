import 'package:get_it/get_it.dart';
import 'package:qr_reader/features/auth/login/logic/cubit/firebase_login_cubit.dart';
import 'package:qr_reader/features/auth/login/logic/firebase/firebase_auth_repository.dart';
import 'package:qr_reader/features/scan/data/qr_repo.dart';
import 'package:qr_reader/features/scan/logic/qr_cubit/qr_scan_cubit.dart';

final GetIt sl = GetIt.instance;

void setupLocator() {
  sl.registerLazySingleton<FirebaseAuthRepository>(
    () => FirebaseAuthRepository(),
  );
  sl.registerLazySingleton<LoginCubit>(
    () => LoginCubit(sl<FirebaseAuthRepository>()),
  );
  sl.registerLazySingleton<QRRepository>(() => QRRepository());
  sl.registerFactory<QRScanCubit>(() => QRScanCubit(sl<QRRepository>()));
}
