import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sports_app/features/basketball/presentation/screen/basketball_live_score_view.dart';
import 'package:sports_app/features/football/presentation/screen/football_live_score_view.dart';
import 'package:sports_app/features/home/presentation/widgets/bottom_icon_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;
  static final List<Widget> _widgetOptions = <Widget>[
    const FootballLiveScoreView(),
    const BasketballLiveScoreView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(selectedIndex),
      bottomNavigationBar: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(vertical: 0.w),
        height: 60.h,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.w),
                topRight: Radius.circular(20.w)),
            boxShadow: [
              BoxShadow(
                offset: const Offset(-0, -2),
                blurRadius: 2,
                color: Colors.grey.withOpacity(0.2),
              ),
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            BottomIconTile(
                iconPath: 'assets/icons/football.png',
                labelName: 'Football',
                iconColor: selectedIndex == 0 ? Colors.black : Colors.grey,
                labelColor: selectedIndex == 0 ? Colors.black : Colors.grey,
                onTap: () {
                  setState(() {
                    selectedIndex = 0;
                  });
                }),
            BottomIconTile(
                iconPath: 'assets/icons/basketball.png',
                labelName: 'Basketball',
                iconColor: selectedIndex == 1 ? Colors.black : Colors.grey,
                labelColor: selectedIndex == 1 ? Colors.black : Colors.grey,
                onTap: () {
                  setState(() {
                    selectedIndex = 1;
                  });
                }),
          ],
        ),
      ),
    );
  }
}
