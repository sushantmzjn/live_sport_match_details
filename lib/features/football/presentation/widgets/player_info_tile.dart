import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PlayerInfoTile extends StatelessWidget {
  final String title;
  final String subTitle;
  const PlayerInfoTile(
      {super.key, required this.title, required this.subTitle});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title),
          Flexible(
              child: Text(subTitle.trim().isEmpty ? 'n/a' : subTitle,
                  textAlign: TextAlign.end)),
        ],
      ),
    );
  }
}
