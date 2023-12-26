import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sports_app/config/widgets/custom_loading.dart';
import 'package:sports_app/features/football/presentation/provider/football_live_score_provider.dart';
import 'package:sports_app/features/football/presentation/screen/football_match_detail_view.dart';

class FootballLiveScoreView extends ConsumerWidget {
  const FootballLiveScoreView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final liveScoreData = ref.watch(footballLiveScoreDataProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'FootBall Live Matches',
          style: TextStyle(fontSize: 22.sp, letterSpacing: 1.0),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 4.sp),
            child: IconButton(
              onPressed: () async {
                ref.invalidate(footballLiveScoreDataProvider);
              },
              icon: Icon(
                Icons.refresh,
                size: 25.sp,
              ),
            ),
          ),
        ],
      ),
      body: liveScoreData.isError
          ? Center(child: Text(liveScoreData.errorMessage))
          : liveScoreData.isLoad
              ? const CustomCircularLoading()
              : ListView.builder(
                  key: const PageStorageKey<String>('football date'),
                  itemCount: liveScoreData.footballLiveScore.length,
                  itemBuilder: (context, index) {
                    final scoreData = liveScoreData.footballLiveScore[index];
                    return Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 5.w, horizontal: 12.w),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context)
                              .push(CupertinoPageRoute(builder: (context) {
                            return FootballMatchDetailView(
                                footballLiveScoreResponse: scoreData);
                          }));
                        },
                        child: Card(
                          color: Colors.white,
                          surfaceTintColor: Colors.white,
                          elevation: 3.w,
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 12.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Flexible(
                                  child: Column(
                                    children: [
                                      scoreData.home_team_logo.trim().isEmpty
                                          ? Image.asset(
                                              height: 40.w,
                                              width: 40.w,
                                              'assets/icons/football.png')
                                          : SizedBox(
                                              height: 40.w,
                                              width: 40.w,
                                              child: Image.network(
                                                scoreData.home_team_logo,
                                              ),
                                            ),
                                      Text(scoreData.event_home_team),
                                    ],
                                  ),
                                ),
                                Flexible(
                                  child: Column(
                                    children: [
                                      Text(
                                        scoreData.event_final_result,
                                        style: TextStyle(fontSize: 16.sp),
                                      ),
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      Text(
                                        'Time : ${scoreData.event_status}',
                                        style: TextStyle(fontSize: 10.sp),
                                      )
                                    ],
                                  ),
                                ),
                                Flexible(
                                  child: Column(
                                    children: [
                                      scoreData.away_team_logo.trim().isEmpty
                                          ? Image.asset(
                                              height: 40.w,
                                              width: 40.w,
                                              'assets/icons/football.png')
                                          : SizedBox(
                                              height: 40.w,
                                              width: 40.w,
                                              child: Image.network(
                                                scoreData.away_team_logo,
                                              ),
                                            ),
                                      Text(scoreData.event_away_team),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
    );
  }
}
