import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:qr_reader/core/utils/app_colors.dart';
import 'package:qr_reader/core/utils/app_text_styles.dart';

class DataModel extends StatelessWidget {
  final String data;
  const DataModel({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75.h,
      width: 305.w,
      decoration: BoxDecoration(
        color: AppColors.resultContainerColor,
        borderRadius: BorderRadius.circular(11.r),
      ),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0.r),
            child: SvgPicture.asset("assets/svgs/data-model-icon.svg"),
          ),
          Text(data, style: AppTextStyles.inter14Black400),
        ],
      ),
    );
  }
}
