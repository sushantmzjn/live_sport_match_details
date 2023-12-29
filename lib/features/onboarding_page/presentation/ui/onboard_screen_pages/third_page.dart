import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ThirdPage extends StatelessWidget {
  const ThirdPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/icons/onboard_baseball.png',
          height: 400.h,
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 8.w, horizontal: 12.w),
          child: Text(
            'Retrieve the latest live match details, statistics, and scores for baseball',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18.sp),
          ),
        )
      ],
    );
  }
}
