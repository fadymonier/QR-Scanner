import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/svg.dart';
import 'package:qr_reader/core/services/service_locator.dart';
import 'package:qr_reader/core/utils/app_colors.dart';
import 'package:qr_reader/core/utils/app_text_styles.dart';
import 'package:qr_reader/features/scan/logic/qr_cubit/qr_scan_cubit.dart';

class DataModel extends StatelessWidget {
  final String data;
  final int index;
  const DataModel({super.key, required this.data, required this.index});

  @override
  Widget build(BuildContext context) {
    return Slidable(
      startActionPane: ActionPane(
        motion: const BehindMotion(),
        extentRatio: 0.3,
        children: [
          SlidableAction(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(11.r),
              bottomLeft: Radius.circular(11.r),
            ),
            backgroundColor: AppColors.darkGreyColor,
            foregroundColor: AppColors.whiteColor,
            icon: Icons.copy_rounded,
            label: 'Copy',
            onPressed: (BuildContext context) {
              Clipboard.setData(ClipboardData(text: data));
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text('Copied to clipboard')));
            },
          ),
        ],
      ),
      endActionPane: ActionPane(
        motion: const BehindMotion(),
        extentRatio: 0.3,
        children: [
          SlidableAction(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(11.r),
              bottomRight: Radius.circular(11.r),
            ),
            backgroundColor: AppColors.errorColor,
            foregroundColor: AppColors.whiteColor,
            icon: Icons.delete_rounded,
            label: 'Delete',
            onPressed: (BuildContext context) {
              sl<QRScanCubit>().deleteQRItem(index);
            },
          ),
        ],
      ),
      child: Container(
        height: 75.h,
        width: double.infinity,
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
            Expanded(
              child: Text(
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                data,
                style: AppTextStyles.inter14Black400,
              ),
            ),
            SizedBox(width: 10.w),
          ],
        ),
      ),
    );
  }
}
