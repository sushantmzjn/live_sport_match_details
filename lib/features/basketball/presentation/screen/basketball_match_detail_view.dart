import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sports_app/features/basketball/data/model/basketball_live_score_response.dart';
import 'package:sports_app/features/basketball/presentation/screen/basketball_tabbar_pages/basketball_scores.dart';
import 'package:sports_app/features/basketball/presentation/screen/basketball_tabbar_pages/basketball_statistics.dart';

class BasketballMatchDetailView extends StatelessWidget {
  final BasketballLiveScoreResponse liveScoreResponse;
  const BasketballMatchDetailView({super.key, required this.liveScoreResponse});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${liveScoreResponse.event_home_team} Vs ${liveScoreResponse.event_away_team}',
          style: TextStyle(fontSize: 18.sp),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8.w),
            child: Text(
              liveScoreResponse.league_name,
              style: TextStyle(fontSize: 18.sp),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Flexible(
                child: Column(
                  children: [
                    liveScoreResponse.event_home_team_logo.trim().isEmpty
                        ? Image.asset(
                            'assets/icons/basketball.png',
                            height: 80.w,
                            width: 80.w,
                          )
                        : SizedBox(
                            height: 80.w,
                            width: 80.w,
                            child: Image.network(
                              liveScoreResponse.event_home_team_logo,
                            ),
                          ),
                    Text(liveScoreResponse.event_home_team),
                  ],
                ),
              ),
              Flexible(
                child: Column(
                  children: [
                    Text(
                      liveScoreResponse.event_final_result,
                      style: TextStyle(fontSize: 34.sp),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      'Time : ${liveScoreResponse.event_status}',
                      style: TextStyle(fontSize: 20.sp),
                    )
                  ],
                ),
              ),
              Flexible(
                child: Column(
                  children: [
                    liveScoreResponse.event_away_team_logo.trim().isEmpty
                        ? Image.asset('assets/icons/basketball.png')
                        : SizedBox(
                            height: 80.w,
                            width: 80.w,
                            child: Image.network(
                              liveScoreResponse.event_away_team_logo,
                            ),
                          ),
                    Text(liveScoreResponse.event_away_team),
                  ],
                ),
              )
            ],
          ),
          Divider(
            color: Colors.black12,
            thickness: 0.8.w,
          ),
          Expanded(
            child: DefaultTabController(
              length: 3,
              child: Column(
                children: [
                  TabBar(
                    overlayColor: MaterialStateProperty.resolveWith(
                      (Set states) {
                        return states.contains(MaterialState.focused)
                            ? null
                            : Colors.transparent;
                      },
                    ),
                    labelColor: Colors.black,
                    indicatorColor: Colors.black,
                    dividerColor: Colors.transparent,
                    unselectedLabelColor: Colors.grey,
                    tabs: const [
                      Tab(
                        text: 'Statistics',
                      ),
                      Tab(
                        text: 'Scores',
                      ),
                      Tab(
                        text: 'Substitutes',
                      ),
                    ],
                  ),
                  Expanded(
                    child: TabBarView(children: [
                      BasketballStatistics(matchStatistics: liveScoreResponse),
                      BasketballScores(matchScores: liveScoreResponse),
                      Text('SubstitutesView'),
                    ]),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
