import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sports_app/config/theme/theme_provider.dart';
import 'package:sports_app/features/football/data/model/football_live_score_response.dart';
import 'package:sports_app/features/football/presentation/screen/tab_bar_pages/foul_card.dart';
import 'package:sports_app/features/football/presentation/screen/tab_bar_pages/score_view.dart';
import 'package:sports_app/features/football/presentation/screen/tab_bar_pages/statistics.dart';
import 'package:sports_app/features/football/presentation/screen/tab_bar_pages/substitutes.dart';
import 'package:sports_app/features/football/presentation/screen/team_info_view.dart';

class FootballMatchDetailView extends StatelessWidget {
  final FootballLiveScoreResponse footballLiveScoreResponse;
  const FootballMatchDetailView(
      {super.key, required this.footballLiveScoreResponse});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${footballLiveScoreResponse.event_home_team} Vs ${footballLiveScoreResponse.event_away_team}',
          style: TextStyle(fontSize: 18.sp),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8.w),
            child: Text(
              footballLiveScoreResponse.league_name,
              style: TextStyle(fontSize: 18.sp),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Flexible(
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context)
                        .push(CupertinoPageRoute(builder: (context) {
                      return TeamInfoView(
                        teamId: footballLiveScoreResponse.home_team_key,
                        footballLiveScoreResponse: footballLiveScoreResponse,
                      );
                    }));
                  },
                  child: Column(
                    children: [
                      footballLiveScoreResponse.home_team_logo.trim().isEmpty
                          ? Image.asset(
                              'assets/icons/football.png',
                              height: 80.w,
                              width: 80.w,
                            )
                          : SizedBox(
                              height: 80.w,
                              width: 80.w,
                              child: Image.network(
                                footballLiveScoreResponse.home_team_logo,
                              ),
                            ),
                      Text(footballLiveScoreResponse.event_home_team),
                    ],
                  ),
                ),
              ),
              Flexible(
                child: Column(
                  children: [
                    Text(
                      footballLiveScoreResponse.event_final_result,
                      style: TextStyle(fontSize: 34.sp),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      'Time : ${footballLiveScoreResponse.event_status}',
                      style: TextStyle(fontSize: 20.sp),
                    )
                  ],
                ),
              ),
              Flexible(
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context)
                        .push(CupertinoPageRoute(builder: (context) {
                      return TeamInfoView(
                        teamId: footballLiveScoreResponse.away_team_key,
                        footballLiveScoreResponse: footballLiveScoreResponse,
                      );
                    }));
                  },
                  child: Column(
                    children: [
                      footballLiveScoreResponse.away_team_logo.trim().isEmpty
                          ? Image.asset(
                              height: 80.w,
                              width: 80.w,
                              'assets/icons/football.png')
                          : SizedBox(
                              height: 80.w,
                              width: 80.w,
                              child: Image.network(
                                footballLiveScoreResponse.away_team_logo,
                              ),
                            ),
                      Text(footballLiveScoreResponse.event_away_team),
                    ],
                  ),
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
              length: 4,
              child: Column(
                children: [
                  Consumer(
                    builder:
                        (BuildContext context, WidgetRef ref, Widget? child) {
                      final themeData = ref.watch(themeProvider);
                      return TabBar(
                        overlayColor: MaterialStateProperty.resolveWith(
                          (Set states) {
                            return states.contains(MaterialState.focused)
                                ? null
                                : Colors.transparent;
                          },
                        ),
                        labelColor:
                            themeData.isDarkMode ? Colors.white : Colors.black,
                        indicatorColor:
                            themeData.isDarkMode ? Colors.white : Colors.black,
                        dividerColor: Colors.transparent,
                        unselectedLabelColor: Colors.grey,
                        tabs: const [
                          Tab(
                            text: 'Statistics',
                          ),
                          Tab(
                            text: 'Goal Scores',
                          ),
                          Tab(
                            text: 'Substitutes',
                          ),
                          Tab(
                            text: 'Card',
                          ),
                        ],
                      );
                    },
                  ),
                  Expanded(
                    child: TabBarView(children: [
                      StatisticsView(footballData: footballLiveScoreResponse),
                      ScoreView(footballData: footballLiveScoreResponse),
                      SubstitutesView(footballData: footballLiveScoreResponse),
                      FoulCard(footballData: footballLiveScoreResponse),
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
