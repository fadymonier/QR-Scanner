import 'package:get_it/get_it.dart';
import 'package:qr_reader/features/auth/login/logic/cubit/firebase_login_cubit.dart';
import 'package:qr_reader/features/auth/login/logic/firebase/firebase_auth_repository.dart';

final GetIt sl = GetIt.instance;

void setupLocator() {
  sl.registerLazySingleton<FirebaseAuthRepository>(
    () => FirebaseAuthRepository(),
  );

  sl.registerLazySingleton<LoginCubit>(
    () => LoginCubit(sl<FirebaseAuthRepository>()),
  );
}
