import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:qr_reader/core/services/service_locator.dart';
import 'package:qr_reader/features/auth/login/logic/cubit/firebase_login_cubit.dart';
import 'package:qr_reader/features/auth/login/logic/firebase/firebase_auth_repository.dart';
import 'package:qr_reader/features/scan/data/image_picker_repo.dart';
import 'package:qr_reader/features/scan/data/qr_repo.dart';
import 'package:qr_reader/features/scan/logic/img_picker_cubit/image_picker_cubit.dart';
import 'package:qr_reader/features/scan/logic/qr_cubit/qr_scan_cubit.dart';

@GenerateMocks([FirebaseAuthRepository])
import 'service_locator_test.mocks.dart';

void main() {
  late MockFirebaseAuthRepository mockAuthRepo;

  setUp(() async {
    sl.reset();

    TestWidgetsFlutterBinding.ensureInitialized();

    mockAuthRepo = MockFirebaseAuthRepository();

    sl.registerLazySingleton<FirebaseAuthRepository>(() => mockAuthRepo);
    sl.registerLazySingleton<LoginCubit>(
      () => LoginCubit(sl<FirebaseAuthRepository>()),
    );
    sl.registerLazySingleton<QRRepository>(() => QRRepository());
    sl.registerFactory<QRScanCubit>(() => QRScanCubit(sl<QRRepository>()));
    sl.registerLazySingleton<ImagePickerRepository>(
      () => ImagePickerRepository(),
    );
    sl.registerFactory<ImagePickerCubit>(
      () => ImagePickerCubit(sl<ImagePickerRepository>(), sl<QRRepository>()),
    );
  });

  test('Service Locator should register all services correctly', () {
    expect(sl.isRegistered<FirebaseAuthRepository>(), true);
    expect(sl.isRegistered<LoginCubit>(), true);
    expect(sl.isRegistered<QRRepository>(), true);
    expect(sl.isRegistered<QRScanCubit>(), true);
    expect(sl.isRegistered<ImagePickerRepository>(), true);
    expect(sl.isRegistered<ImagePickerCubit>(), true);
  });

  test('Service Locator should resolve dependencies correctly', () {
    expect(sl<FirebaseAuthRepository>(), isA<FirebaseAuthRepository>());
    expect(sl<LoginCubit>(), isA<LoginCubit>());
    expect(sl<QRRepository>(), isA<QRRepository>());
    expect(sl<QRScanCubit>(), isA<QRScanCubit>());
    expect(sl<ImagePickerRepository>(), isA<ImagePickerRepository>());
    expect(sl<ImagePickerCubit>(), isA<ImagePickerCubit>());
  });
}
