import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CustomCircularLoading extends StatelessWidget {
  const CustomCircularLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Transform.scale(
            scale: .8.sp,
            child: CircularProgressIndicator(
              color: Colors.black,
              strokeWidth: 3.sp,
            ),
          ),
          SpinKitDoubleBounce(
            size: 24.w,
            color: Colors.black,
          )
        ],
      ),
    );
  }
}
