import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qr_reader/core/utils/app_colors.dart';

abstract class AppTextStyles {
  static final inter24Black600 = GoogleFonts.inter(
    fontSize: 24.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.blackColor,
  );

  static final buttonTextStyle = GoogleFonts.inter(
    fontSize: 16.sp,
    fontWeight: FontWeight.w700,
    color: AppColors.whiteColor,
  );

  static final errorTextStyle = GoogleFonts.inter(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.errorColor,
  );

  static final inter14LightGrey500 = GoogleFonts.inter(
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.darkGreyColor,
  );
  static final inter16Black700 = GoogleFonts.inter(
    fontSize: 16.sp,
    fontWeight: FontWeight.w700,
    color: AppColors.blackColor,
  );
  static final inter12LightGrey500 = GoogleFonts.inter(
    fontSize: 12.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.darkGreyColor,
  );
  static final inter14Black400 = GoogleFonts.inter(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.blackColor,
  );
}
