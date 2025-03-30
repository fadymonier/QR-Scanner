import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qr_reader/core/utils/app_text_styles.dart';
import 'package:qr_reader/features/auth/login/presentation/widgets/login_body.dart';
import 'package:qr_reader/features/auth/login/logic/cubit/firebase_login_cubit.dart';
import 'package:qr_reader/core/services/service_locator.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    precacheImage(const AssetImage('assets/images/LoginBG.png'), context);
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    final loginCubit = sl<LoginCubit>();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.transparent,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset('assets/images/LoginBG.png', fit: BoxFit.cover),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: 100.h),
                  Text("Login", style: AppTextStyles.inter24Black600),
                  SizedBox(height: 145.h),
                  ConstrainedBox(
                    constraints: BoxConstraints(maxHeight: 400.h),
                    child: LoginBody(
                      emailController: emailController,
                      passwordController: passwordController,
                      loginCubit: loginCubit,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
