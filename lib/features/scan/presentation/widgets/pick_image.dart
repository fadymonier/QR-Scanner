import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:qr_reader/features/scan/logic/img_picker_cubit/image_picker_cubit.dart';

class PickImageWidget extends StatelessWidget {
  const PickImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ImagePickerCubit, ImagePickerState>(
      listener: (context, state) {
        if (state is ImagePickerSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("✅ Data Saved Successfully!"),
              backgroundColor: Colors.green,
            ),
          );
        } else if (state is ImagePickerError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("❌ Error: ${state.message}"),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      child: InkWell(
        onTap: () {
          context.read<ImagePickerCubit>().pickImageAndScanQR();
        },
        child: SvgPicture.asset("assets/svgs/scan-screen-1.svg"),
      ),
    );
  }
}
