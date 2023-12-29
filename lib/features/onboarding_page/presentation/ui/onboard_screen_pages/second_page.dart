import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/icons/onboard_basketball.png',
          height: 400.h,
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 8.w, horizontal: 12.w),
          child: Text(
            'Retrieve the latest live match details, statistics, and scores for basketball',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18.sp),
          ),
        )
      ],
    );
  }
}
