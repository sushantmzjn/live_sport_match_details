import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sports_app/config/widgets/custom_divider.dart';
import 'package:sports_app/features/basketball/data/model/basketball_live_score_response.dart';

class BasketballScores extends StatelessWidget {
  final BasketballLiveScoreResponse matchScores;
  BasketballScores({super.key, required this.matchScores});

  final txtStyle = TextStyle(fontSize: 20.sp, letterSpacing: 1.w);
  final assistStyle = const TextStyle(color: Colors.redAccent);

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
                Text(matchScores.event_home_team, style: txtStyle),
                Text(matchScores.event_away_team, style: txtStyle),
              ],
            ),
          ),
          ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: matchScores.scores.firstQuarter.length,
              itemBuilder: (context, index) {
                final firstQuarterData = matchScores.scores.firstQuarter[index];
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('1st Quarter', style: txtStyle),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(firstQuarterData.score_home),
                          Text(firstQuarterData.score_away),
                        ],
                      ),
                    ),
                    const CustomDivider()
                  ],
                );
              }),
          ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: matchScores.scores.secondQuarter.length,
              itemBuilder: (context, secondQuarterIndex) {
                final secondQuarterData =
                    matchScores.scores.secondQuarter[secondQuarterIndex];
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('2nd Quarter', style: txtStyle),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(secondQuarterData.score_home),
                          Text(secondQuarterData.score_away),
                        ],
                      ),
                    ),
                    const CustomDivider()
                  ],
                );
              }),
          ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: matchScores.scores.thirdQuarter.length,
              itemBuilder: (context, thirdQuarterIndex) {
                final thirdQuarterData =
                    matchScores.scores.thirdQuarter[thirdQuarterIndex];
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('3rd Quarter', style: txtStyle),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(thirdQuarterData.score_home),
                          Text(thirdQuarterData.score_away),
                        ],
                      ),
                    ),
                    const CustomDivider()
                  ],
                );
              }),
          ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: matchScores.scores.fourthQuarter.length,
              itemBuilder: (context, fourthQuarterIndex) {
                final fourthQuarterData =
                    matchScores.scores.fourthQuarter[fourthQuarterIndex];
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('4th Quarter', style: txtStyle),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(fourthQuarterData.score_home),
                          Text(fourthQuarterData.score_away),
                        ],
                      ),
                    ),
                    const CustomDivider()
                  ],
                );
              })
        ],
      ),
    );
  }
}
