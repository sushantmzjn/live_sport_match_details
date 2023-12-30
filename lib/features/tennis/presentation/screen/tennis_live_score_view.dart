import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TennisLiveScoreView extends ConsumerWidget {
  const TennisLiveScoreView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Tennis Live Matches',
          style: TextStyle(fontSize: 22.sp, letterSpacing: 1.0),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 4.sp),
            child: IconButton(
              onPressed: () async {},
              icon: Icon(
                Icons.refresh,
                size: 25.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
