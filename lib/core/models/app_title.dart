// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import '../widgets/app_divider.dart';

class AppTitle extends StatelessWidget {
  String title;
  bool showDivider;
  TextStyle textStyle;
  AppTitle(
      {super.key,
      required this.title,
      required this.showDivider,
      required this.textStyle});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: textStyle,
        ),
        if (showDivider == true) AppDivider(),
      ],
    );
  }
}
