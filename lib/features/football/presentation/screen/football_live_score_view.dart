import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sports_app/config/theme/theme_provider.dart';
import 'package:sports_app/config/widgets/custom_loading.dart';
import 'package:sports_app/features/football/presentation/provider/football_live_score_provider.dart';
import 'package:sports_app/features/football/presentation/screen/football_match_detail_view.dart';

class FootballLiveScoreView extends ConsumerWidget {
  const FootballLiveScoreView({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final liveScoreData = ref.watch(footballLiveScoreDataProvider);
    final themeData = ref.watch(themeProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'FootBall Live Matches',
          style: TextStyle(fontSize: 22.sp, letterSpacing: 1.0),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 4.sp),
            child: Row(
              children: [
                Text('Theme', style: TextStyle(fontSize: 16.sp)),
                Transform.scale(
                  scale: 0.85,
                  child: Switch(
                    activeColor: Colors.transparent,
                    inactiveThumbColor: const Color.fromRGBO(0, 0, 0, 0),
                    activeTrackColor: Colors.white,
                    thumbColor: MaterialStateProperty.resolveWith<Color>(
                        (Set<MaterialState> states) {
                      if (states.contains(MaterialState.disabled)) {
                        return Colors.white.withOpacity(.48);
                      }
                      return Colors.white;
                    }),
                    activeThumbImage: const AssetImage('assets/icons/dark.png'),
                    inactiveThumbImage:
                        const AssetImage('assets/icons/light.png'),
                    value: themeData.isDarkMode,
                    onChanged: (value) {
                      // setState(() {
                      //   isDarkModeEnabled = value;
                      //   saveDarkModeSetting(value);
                      // });
                      ref.read(themeProvider.notifier).toggleTheme();
                    },
                  ),
                ),
                IconButton(
                  onPressed: () async {
                    ref.invalidate(footballLiveScoreDataProvider);
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
                    key: const PageStorageKey<String>('football data'),
                    itemCount: liveScoreData.footballLiveScore.length,
                    itemBuilder: (context, index) {
                      final scoreData = liveScoreData.footballLiveScore[index];
                      return scoreData.msg.isNotEmpty
                          ? Center(
                              child: Text('Api key expired ${scoreData.msg}'))
                          : Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 5.w, horizontal: 12.w),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(
                                      CupertinoPageRoute(builder: (context) {
                                    return FootballMatchDetailView(
                                        footballLiveScoreResponse: scoreData);
                                  }));
                                },
                                child: Card(
                                  color:
                                      themeData.themeData.colorScheme.primary,
                                  surfaceTintColor:
                                      themeData.themeData.colorScheme.primary,
                                  elevation: 3.w,
                                  child: Padding(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 12.w),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Flexible(
                                          child: Column(
                                            children: [
                                              scoreData.home_team_logo
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
                                                            .home_team_logo,
                                                      ),
                                                    ),
                                              SizedBox(
                                                  width: 60.w,
                                                  child: Text(
                                                    scoreData.event_home_team,
                                                    textAlign: TextAlign.center,
                                                    maxLines: 1,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  )),
                                            ],
                                          ),
                                        ),
                                        Flexible(
                                          child: Column(
                                            children: [
                                              Text(
                                                scoreData.event_final_result,
                                                style:
                                                    TextStyle(fontSize: 16.sp),
                                              ),
                                              SizedBox(
                                                height: 10.h,
                                              ),
                                              Text(
                                                'Time : ${scoreData.event_status}',
                                                style:
                                                    TextStyle(fontSize: 10.sp),
                                              )
                                            ],
                                          ),
                                        ),
                                        Flexible(
                                          child: Column(
                                            children: [
                                              scoreData.away_team_logo
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
                                                            .away_team_logo,
                                                      ),
                                                    ),
                                              SizedBox(
                                                  width: 60.w,
                                                  child: Text(
                                                    scoreData.event_away_team,
                                                    textAlign: TextAlign.center,
                                                    maxLines: 1,
                                                    overflow:
                                                        TextOverflow.ellipsis,
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
