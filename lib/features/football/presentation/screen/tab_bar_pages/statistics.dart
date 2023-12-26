import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sports_app/features/football/data/model/football_live_score_response.dart';

class StatisticsView extends StatelessWidget {
  final FootballLiveScoreResponse footballData;
  StatisticsView({super.key, required this.footballData});

  final txtStyle = TextStyle(fontSize: 20.sp, letterSpacing: 1.w);
  final txtStyle1 = TextStyle(fontSize: 15.sp);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(footballData.event_home_team, style: txtStyle),
                Text(footballData.event_away_team, style: txtStyle),
              ],
            ),
          ),
          Expanded(
            child: footballData.statistics.isEmpty
                ? Center(child: Text('No Data Available', style: txtStyle1))
                : ListView.builder(
                    shrinkWrap: true,
                    itemCount: footballData.statistics.length,
                    itemBuilder: (context, index) {
                      final statData = footballData.statistics[index];
                      return Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 24.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 2.w),
                                  child: Text(statData.home, style: txtStyle1),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 2.w),
                                  child: Text(statData.type, style: txtStyle1),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 2.w),
                                  child: Text(statData.away, style: txtStyle1),
                                ),
                              ],
                            ),
                          ),
                          Divider(
                            color: Colors.black.withOpacity(0.2),
                            thickness: 0.8.w,
                          ),
                        ],
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
