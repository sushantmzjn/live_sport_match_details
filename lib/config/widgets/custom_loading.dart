import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCircularLoading extends StatelessWidget {
  const CustomCircularLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Transform.scale(
        scale: .8.sp,
        child: CircularProgressIndicator(
          color: Colors.black,
          strokeWidth: 3.sp,
        ),
      ),
    );
  }
}
