// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomIconTile extends StatelessWidget {
  final String iconPath;
  final String labelName;
  void Function() onTap;
  Color iconColor;
  Color labelColor;
  BottomIconTile({
    super.key,
    required this.iconPath,
    required this.labelName,
    required this.onTap,
    required this.iconColor,
    required this.labelColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            iconPath,
            height: 20.h,
            color: iconColor,
          ),
          Padding(
            padding: EdgeInsets.only(top: 2.w),
            child: Text(
              labelName,
              style: TextStyle(color: labelColor),
            ),
          ),
        ],
      ),
    );
  }
}
