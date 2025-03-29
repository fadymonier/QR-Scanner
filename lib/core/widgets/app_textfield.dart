import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qr_reader/core/utils/app_colors.dart';
import 'package:qr_reader/core/utils/app_text_styles.dart';

class AppTextField extends StatefulWidget {
  final String labelText;
  final bool obscureText;
  final bool showSuffixIcon;
  final TextEditingController controller;
  final String? errorText;
  final TextInputType keyboardType;

  const AppTextField({
    super.key,
    required this.labelText,
    required this.obscureText,
    required this.controller,
    this.showSuffixIcon = false,
    this.errorText,
    required this.keyboardType,
  });

  @override
  AppTextFieldState createState() => AppTextFieldState();
}

class AppTextFieldState extends State<AppTextField> {
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;
  }

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            controller: widget.controller,
            obscureText: _obscureText,
            keyboardType: widget.keyboardType,
            style: GoogleFonts.inter(
              fontSize: 18.sp,
              color: AppColors.blackColor,
            ),
            decoration: InputDecoration(
              filled: true,
              fillColor: AppColors.whiteColor,
              hintText: widget.labelText,
              hintStyle: GoogleFonts.inter(
                fontSize: 14.sp,
                color: AppColors.lightGreyColor,
              ),
              contentPadding: EdgeInsets.symmetric(
                horizontal: 16.w,
                vertical: 18.h,
              ),
              border: getBorderStyle(AppColors.lightGreyColor),
              enabledBorder: getBorderStyle(AppColors.lightGreyColor),
              focusedBorder: getBorderStyle(AppColors.lightGreyColor),
              errorBorder: getBorderStyle(AppColors.errorColor),
              focusedErrorBorder: getBorderStyle(AppColors.errorColor),
              suffixIcon:
                  widget.showSuffixIcon
                      ? IconButton(
                        icon: Icon(
                          _obscureText
                              ? Icons.visibility_rounded
                              : Icons.visibility_off,
                          color: AppColors.darkGreyColor,
                        ),
                        onPressed: _togglePasswordVisibility,
                      )
                      : null,
            ),
          ),
          if (widget.errorText != null)
            Padding(
              padding: EdgeInsets.only(top: 4.h),
              child: Text(
                widget.errorText!,
                style: AppTextStyles.errorTextStyle,
              ),
            ),
        ],
      ),
    );
  }
}

OutlineInputBorder getBorderStyle(Color color) {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(1.r),
    borderSide: BorderSide(color: color, width: 1.5),
  );
}
