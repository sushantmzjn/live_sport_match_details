import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sports_app/config/widgets/custom_loading.dart';
import 'package:sports_app/features/tennis/presentation/provider/tennis_live_score_provider.dart';

class TennisLiveScoreView extends ConsumerWidget {
  const TennisLiveScoreView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final liveScoreData = ref.watch(tennisLiveScoreProvider);
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
              onPressed: () async {
                ref.invalidate(tennisLiveScoreProvider);
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
              : RawScrollbar(
                  thumbColor: Colors.black.withOpacity(0.7),
                  crossAxisMargin: 2,
                  fadeDuration: const Duration(milliseconds: 200),
                  radius: Radius.circular(60.w),
                  thickness: 5.w,
                  child: ListView.builder(
                    key: const PageStorageKey<String>('cricket data'),
                    itemCount: liveScoreData.tennisLiveScore.length,
                    itemBuilder: (context, index) {
                      final scoreData = liveScoreData.tennisLiveScore[index];
                      return Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 5.w, horizontal: 12.w),
                        child: GestureDetector(
                          onTap: () {
                            // Navigator.of(context)
                            //     .push(CupertinoPageRoute(builder: (context) {
                            //   return FootballMatchDetailView(
                            //       footballLiveScoreResponse: scoreData);
                            // }));
                          },
                          child: Card(
                            color: Colors.white,
                            surfaceTintColor: Colors.white,
                            elevation: 3.w,
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 12.w),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Flexible(
                                    child: Column(
                                      children: [
                                        scoreData.event_first_player_logo
                                                .trim()
                                                .isEmpty
                                            ? Image.asset(
                                                height: 40.w,
                                                width: 40.w,
                                                'assets/icons/football.png')
                                            : SizedBox(
                                                height: 40.w,
                                                width: 40.w,
                                                child: Image.network(
                                                  scoreData
                                                      .event_first_player_logo,
                                                ),
                                              ),
                                        SizedBox(
                                            width: 60.w,
                                            child: Text(
                                              scoreData.event_first_player,
                                              textAlign: TextAlign.center,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                            )),
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
                                          'Status : ${scoreData.event_status}',
                                          style: TextStyle(fontSize: 10.sp),
                                        )
                                      ],
                                    ),
                                  ),
                                  Flexible(
                                    child: Column(
                                      children: [
                                        scoreData.event_second_player_logo
                                                .trim()
                                                .isEmpty
                                            ? Image.asset(
                                                height: 40.w,
                                                width: 40.w,
                                                'assets/icons/football.png')
                                            : SizedBox(
                                                height: 40.w,
                                                width: 40.w,
                                                child: Image.network(
                                                  scoreData
                                                      .event_second_player_logo,
                                                ),
                                              ),
                                        SizedBox(
                                            width: 60.w,
                                            child: Text(
                                              scoreData.event_second_player,
                                              textAlign: TextAlign.center,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                            )),
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
                ),
    );
  }
}
