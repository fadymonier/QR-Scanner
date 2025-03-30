import 'package:camera/camera.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qr_reader/core/cache/cache_helper.dart';
import 'package:qr_reader/core/cache/cache_keys.dart';
import 'package:qr_reader/core/routes/app_router.dart';
import 'package:qr_reader/core/services/service_locator.dart';
import 'package:qr_reader/features/scan/data/qr_data_model.dart';
import 'package:qr_reader/firebase_options.dart';
import 'package:hive_flutter/hive_flutter.dart';

List<CameraDescription> cameras = [];

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  setupLocator();
  cameras = await availableCameras();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await Hive.initFlutter();
  Hive.registerAdapter(QRDataModelAdapter());
  await Hive.openBox<QRDataModel>('qr_codes');
  final String userUid = await SharedPrefHelper.getSecuredString(
    SharedPrefKeys.userUid,
  );
  if (kDebugMode) {
    print("UserUID $userUid");
  }

  FlutterError.onError = (errorDetails) {
    FirebaseCrashlytics.instance.recordFlutterError(errorDetails);
  };
  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack);
    return true;
  };
  runApp(MyApp(isLoggedIn: userUid.isNotEmpty));
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;
  const MyApp({super.key, required this.isLoggedIn});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(428, 926),
      minTextAdapt: true,
      splitScreenMode: true,
      builder:
          (context, child) => MaterialApp(
            debugShowCheckedModeBanner: false,
            initialRoute: isLoggedIn ? AppRouter.scanScreen : AppRouter.login,
            onGenerateRoute: AppRouter.generateRoute,
          ),
    );
  }
}
