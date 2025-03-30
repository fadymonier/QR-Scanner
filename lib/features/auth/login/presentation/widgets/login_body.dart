import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qr_reader/core/routes/app_router.dart';
import 'package:qr_reader/core/utils/app_colors.dart';
import 'package:qr_reader/core/utils/app_text_styles.dart';
import 'package:qr_reader/core/widgets/app_textfield.dart';
import 'package:qr_reader/core/widgets/custom_btn.dart';
import 'package:qr_reader/features/auth/login/logic/cubit/firebase_login_cubit.dart';
import 'package:qr_reader/features/auth/login/logic/cubit/firebase_login_state.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({
    super.key,
    required this.emailController,
    required this.passwordController,
    required this.loginCubit,
  });

  final TextEditingController emailController;
  final TextEditingController passwordController;
  final LoginCubit loginCubit;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppTextField(
          labelText: "Enter your email",
          obscureText: false,
          controller: emailController,
          keyboardType: TextInputType.emailAddress,
        ),
        SizedBox(height: 16.h),
        AppTextField(
          labelText: "Password",
          obscureText: true,
          showSuffixIcon: true,
          controller: passwordController,
          keyboardType: TextInputType.visiblePassword,
        ),
        SizedBox(height: 16.h),
        Align(
          alignment: Alignment.centerRight,
          child: TextButton(
            onPressed: () {},
            child: Text(
              "Forgot Password?",
              style: AppTextStyles.inter14LightGrey500,
            ),
          ),
        ),
        SizedBox(height: 45.h),
        BlocConsumer<LoginCubit, LoginState>(
          bloc: loginCubit,
          listener: (context, state) {
            if (state is LoginSuccess) {
              Navigator.pushNamedAndRemoveUntil(
                context,
                AppRouter.scanScreen,
                (route) => false,
              );
            } else if (state is LoginFailure) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.errorMessage)));
            }
          },
          builder: (context, state) {
            return SizedBox(
              child: AppCustomBtn(
                color:
                    state is LoginLoading ? Colors.grey : AppColors.mainColor,
                onPressed:
                    state is LoginLoading
                        ? null
                        : () {
                          if (emailController.text.isNotEmpty &&
                              passwordController.text.isNotEmpty) {
                            loginCubit.login(
                              email: emailController.text,
                              password: passwordController.text,
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  "Please enter email and password",
                                ),
                              ),
                            );
                          }
                        },
                text: 'Login',
                child:
                    state is LoginLoading
                        ? SizedBox(
                          width: 24.w,
                          height: 24.w,
                          child: CircularProgressIndicator(
                            color: Colors.white,
                            strokeWidth: 2,
                          ),
                        )
                        : SizedBox(
                          child: Text(
                            "Login",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.sp,
                            ),
                          ),
                        ),
              ),
            );
          },
        ),
      ],
    );
  }
}
