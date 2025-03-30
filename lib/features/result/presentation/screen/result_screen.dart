import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:qr_reader/core/routes/app_router.dart';
import 'package:qr_reader/core/utils/app_colors.dart';
import 'package:qr_reader/core/utils/app_text_styles.dart';
import 'package:qr_reader/core/widgets/custom_appbar.dart';
import 'package:qr_reader/core/widgets/custom_btn.dart';
import 'package:qr_reader/features/result/data/data_model.dart';
import 'package:qr_reader/features/scan/data/qr_data_model.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen({super.key});

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  late Box<QRDataModel> qrBox;

  @override
  void initState() {
    super.initState();
    qrBox = Hive.box<QRDataModel>('qr_codes'); // استرجاع صندوق البيانات
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      appBar: CustomAppBar(),
      body: ClipRRect(
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
                  child: InkWell(
                    onTap:
                        () =>
                            Navigator.pushNamed(context, AppRouter.scanScreen),
                    child: SvgPicture.asset("assets/svgs/result-top-icon.svg"),
                  ),
                ),
                SizedBox(height: 50.h),
                Text("Scanning Result", style: AppTextStyles.inter16Black700),
                SizedBox(height: 30.h),
                Text(
                  textAlign: TextAlign.center,
                  "Proreader will Keep your last 10 days history\nto keep your all scared history please\npurched our pro package",
                  style: AppTextStyles.inter12LightGrey500,
                ),
                SizedBox(height: 60.h),

                Expanded(
                  child: ValueListenableBuilder(
                    valueListenable: qrBox.listenable(),
                    builder: (context, Box<QRDataModel> box, _) {
                      final qrCodes = box.values.toList();

                      if (qrCodes.isEmpty) {
                        return Center(
                          child: Text(
                            "No scanned data available",
                            style: AppTextStyles.inter16Black700,
                          ),
                        );
                      }

                      return ListView.separated(
                        separatorBuilder:
                            (context, index) => SizedBox(height: 14.h),
                        itemCount: qrCodes.length,
                        itemBuilder: (BuildContext context, int index) {
                          return DataModel(
                            data: qrCodes[index].content.toString(),
                          );
                        },
                      );
                    },
                  ),
                ),
                SizedBox(height: 20.h),
                AppCustomBtn(
                  color: AppColors.mainColor,
                  text: "Send",
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
