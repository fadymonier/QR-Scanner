import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qr_reader/core/utils/app_colors.dart' show AppColors;
import 'package:qr_reader/core/utils/app_text_styles.dart';

class AppCustomBtn extends StatelessWidget {
  const AppCustomBtn({
    super.key,
    required this.color,
    required this.text,
    required this.onPressed,
    SizedBox? child,
  });
  final Color color;
  final String text;
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 320.w,
      height: 58.h,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.mainColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.r),
          ),
        ),
        child: Text(text, style: AppTextStyles.buttonTextStyle),
      ),
    );
  }
}
