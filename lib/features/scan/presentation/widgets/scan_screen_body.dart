import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:qr_reader/core/utils/app_colors.dart';
import 'package:qr_reader/core/utils/app_text_styles.dart';
import 'package:qr_reader/core/widgets/custom_btn.dart';

class ScanScreenBody extends StatelessWidget {
  const ScanScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(30.r),
        topRight: Radius.circular(30.r),
      ),
      child: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(color: AppColors.whiteColor),
        child: Padding(
          padding: EdgeInsets.all(26.0.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset("assets/svgs/divider.svg"),
              Align(
                alignment: Alignment.topRight,
                child: SvgPicture.asset("assets/svgs/scan-screen-top-icon.svg"),
              ),
              SizedBox(height: 50.h),
              Text("Scan OR code", style: AppTextStyles.inter16Black700),
              SizedBox(height: 30.h),
              Text(
                textAlign: TextAlign.center,
                "Place qr code inside the frame to scan please\navoid shake to get results quickly",
                style: AppTextStyles.inter12LightGrey500,
              ),
              SizedBox(height: 75.h),
              SvgPicture.asset("assets/svgs/scan-screen-middle-icon.svg"),
              SizedBox(height: 20.h),
              Text(
                textAlign: TextAlign.center,
                "Tap the Button to scan\nor Import QR Code from gallery",
                style: AppTextStyles.inter12LightGrey500,
              ),
              SizedBox(height: 45.h),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset("assets/svgs/scan-screen-1.svg"),
                  SizedBox(width: 20.h),
                  SvgPicture.asset("assets/svgs/scan-screen-2.svg"),
                  SizedBox(width: 20.h),
                  SvgPicture.asset("assets/svgs/scan-screen-3.svg"),
                ],
              ),
              SizedBox(height: 45.h),
              AppCustomBtn(
                color: AppColors.mainColor,
                text: "Place Camera Code",
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
