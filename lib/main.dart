import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qr_reader/core/cache/cache_helper.dart';
import 'package:qr_reader/core/cache/cache_keys.dart';
import 'package:qr_reader/core/routes/app_router.dart';
import 'package:qr_reader/core/services/dependency_injection.dart';
import 'package:qr_reader/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  setupLocator();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  final String userUid = await SharedPrefHelper.getSecuredString(
    SharedPrefKeys.userUid,
  );
  if (kDebugMode) {
    print("UserUID $userUid");
  }
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
