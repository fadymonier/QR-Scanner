// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qr_reader/core/cache/cache_helper.dart';
import 'package:qr_reader/core/cache/cache_keys.dart';
import 'package:qr_reader/core/utils/app_colors.dart';
import 'package:qr_reader/core/routes/app_router.dart';
import 'package:qr_reader/core/utils/app_text_styles.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 101.h,
      backgroundColor: AppColors.blackColor,
      automaticallyImplyLeading: false,
      actions: [
        IconButton(
          onPressed: () {
            _showLogoutDialog(context);
          },
          icon: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0.r),
            child: Icon(Icons.logout_rounded, color: AppColors.mainColor),
          ),
        ),
      ],
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            backgroundColor: AppColors.whiteColor,
            title: Text(
              "Logout Confirmation",
              style: AppTextStyles.inter24Black600,
            ),
            content: const Text("Are you sure you want to log out?"),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text("No", style: AppTextStyles.inter14LightGrey500),
              ),
              TextButton(
                onPressed: () async {
                  Navigator.pop(context); // Close dialog
                  await FirebaseAuth.instance.signOut();
                  await SharedPrefHelper.removeData(SharedPrefKeys.userUid);
                  Navigator.pushReplacementNamed(context, AppRouter.login);
                },
                child: Text("Yes", style: AppTextStyles.errorTextStyle),
              ),
            ],
          ),
    );
  }
}
