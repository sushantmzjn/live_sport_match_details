import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sports_app/config/theme/theme_provider.dart';
import 'package:sports_app/config/widgets/custom_loading.dart';
import 'package:sports_app/config/widgets/custom_switch.dart';
import 'package:sports_app/features/basketball/presentation/provider/basketball_live_score_provider.dart';
import 'package:sports_app/features/basketball/presentation/screen/basketball_match_detail_view.dart';

class BasketballLiveScoreView extends ConsumerWidget {
  const BasketballLiveScoreView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final basketballLiveScore = ref.watch(basketballLiveScoreProvider);
    final themeData = ref.watch(themeProvider);

    return Scaffold(
        appBar: AppBar(
          title: Text(
            'BasketBall Live Matches',
            style: TextStyle(fontSize: 22.sp, letterSpacing: 1.0),
          ),
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 4.sp),
              child: Row(
                children: [
                  const CustomSwitch(),
                  IconButton(
                    onPressed: () async {
                      ref.invalidate(basketballLiveScoreProvider);
                    },
                    icon: Icon(
                      Icons.refresh,
                      size: 25.sp,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        body: basketballLiveScore.isError
            ? Center(
                child: Text(basketballLiveScore.errorMessage),
              )
            : basketballLiveScore.isLoad
                ? const CustomCircularLoading()
                : RawScrollbar(
                    thumbColor: Colors.black.withOpacity(0.7),
                    crossAxisMargin: 2,
                    fadeDuration: const Duration(milliseconds: 200),
                    radius: Radius.circular(60.w),
                    thickness: 5.w,
                    child: ListView.builder(
                        key: const PageStorageKey<String>('basketball date'),
                        itemCount:
                            basketballLiveScore.basketballLiveScore.length,
                        itemBuilder: (ctx, index) {
                          final scoreData =
                              basketballLiveScore.basketballLiveScore[index];
                          return scoreData.msg.isNotEmpty
                              ? Center(
                                  child:
                                      Text('Api key expired ${scoreData.msg}'))
                              : Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 5.w, horizontal: 12.w),
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).push(
                                          CupertinoPageRoute(
                                              builder: (context) {
                                        return BasketballMatchDetailView(
                                          liveScoreResponse: scoreData,
                                        );
                                      }));
                                    },
                                    child: Card(
                                      color: themeData
                                          .themeData.colorScheme.primary,
                                      surfaceTintColor: themeData
                                          .themeData.colorScheme.primary,
                                      elevation: 3.w,
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 12.w),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Flexible(
                                              child: Column(
                                                children: [
                                                  scoreData.event_home_team_logo
                                                          .trim()
                                                          .isEmpty
                                                      ? Image.asset(
                                                          height: 40.w,
                                                          width: 40.w,
                                                          'assets/icons/basketball.png')
                                                      : SizedBox(
                                                          height: 40.w,
                                                          width: 40.w,
                                                          child: Image.network(
                                                            scoreData
                                                                .event_home_team_logo,
                                                          ),
                                                        ),
                                                  SizedBox(
                                                      width: 60.w,
                                                      child: Text(
                                                        scoreData
                                                            .event_home_team,
                                                        textAlign:
                                                            TextAlign.center,
                                                        maxLines: 1,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                      )),
                                                ],
                                              ),
                                            ),
                                            Flexible(
                                              child: Column(
                                                children: [
                                                  Text(
                                                    scoreData
                                                        .event_final_result,
                                                    style: TextStyle(
                                                        fontSize: 16.sp),
                                                  ),
                                                  SizedBox(
                                                    height: 10.h,
                                                  ),
                                                  Text(
                                                    'Time : ${scoreData.event_status}',
                                                    style: TextStyle(
                                                        fontSize: 10.sp),
                                                  )
                                                ],
                                              ),
                                            ),
                                            Flexible(
                                              child: Column(
                                                children: [
                                                  scoreData.event_away_team_logo
                                                          .trim()
                                                          .isEmpty
                                                      ? Image.asset(
                                                          height: 40.w,
                                                          width: 40.w,
                                                          'assets/icons/basketball.png')
                                                      : SizedBox(
                                                          height: 40.w,
                                                          width: 40.w,
                                                          child: Image.network(
                                                            scoreData
                                                                .event_away_team_logo,
                                                          ),
                                                        ),
                                                  SizedBox(
                                                    width: 60.w,
                                                    child: Text(
                                                      scoreData.event_away_team,
                                                      textAlign:
                                                          TextAlign.center,
                                                      maxLines: 1,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                        }),
                  ));
  }
}
