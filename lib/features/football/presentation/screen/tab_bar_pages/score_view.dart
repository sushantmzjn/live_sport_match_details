import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sports_app/features/football/data/model/football_live_score_response.dart';

class ScoreView extends StatelessWidget {
  final FootballLiveScoreResponse footballData;
  ScoreView({super.key, required this.footballData});

  final txtStyle = TextStyle(fontSize: 20.sp, letterSpacing: 1.w);
  final assistStyle = const TextStyle(color: Colors.redAccent);

  @override
  Widget build(BuildContext context) {
    return footballData.goalscorers.isEmpty
        ? const Center(child: Text('No Data Available'))
        : Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: ListView.builder(
                padding: EdgeInsets.symmetric(vertical: 4.w),
                itemCount: footballData.goalscorers.length,
                itemBuilder: (context, index) {
                  final scoreData = footballData.goalscorers[index];
                  return Card(
                    elevation: 3.w,
                    color: Colors.white,
                    surfaceTintColor: Colors.white,
                    child: Column(children: [
                      if (scoreData.home_scorer.trim().isNotEmpty)
                        Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 8.w, horizontal: 12.w),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10.w),
                                child: Row(
                                  children: [
                                    Text(scoreData.home_scorer),
                                    SizedBox(width: 10.w),
                                    Text('${scoreData.time} mins'),
                                  ],
                                ),
                              ),
                              if (scoreData.home_assist.trim().isNotEmpty)
                                Divider(
                                  color: Colors.black.withOpacity(0.2),
                                  thickness: 0.8.w,
                                ),
                              if (scoreData.home_assist.trim().isNotEmpty)
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 10.w),
                                  child: Text(
                                      'Assist : ${scoreData.home_assist}',
                                      style: assistStyle),
                                )
                            ],
                          ),
                        ),
                      if (scoreData.away_scorer.trim().isNotEmpty)
                        Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 8.w, horizontal: 12.w),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10.w),
                                child: Row(
                                  children: [
                                    Text(scoreData.away_scorer),
                                    SizedBox(width: 10.w),
                                    Text('${scoreData.time} mins'),
                                  ],
                                ),
                              ),
                              if (scoreData.away_assist.trim().isNotEmpty)
                                Divider(
                                  color: Colors.black.withOpacity(0.2),
                                  thickness: 0.8.w,
                                ),
                              if (scoreData.away_assist.trim().isNotEmpty)
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 10.w),
                                  child: Text(
                                      'Assist : ${scoreData.away_assist}',
                                      style: assistStyle),
                                )
                            ],
                          ),
                        ),
                    ]),
                  );
                }),
          );
  }
}
