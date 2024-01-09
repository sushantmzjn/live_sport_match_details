import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sports_app/config/theme/theme_provider.dart';
import 'package:sports_app/config/widgets/custom_loading.dart';
import 'package:sports_app/features/football/data/model/football_live_score_response.dart';
import 'package:sports_app/features/football/presentation/provider/team_info_provider.dart';
import 'package:sports_app/features/football/presentation/screen/player_info_view.dart';

class TeamInfoView extends ConsumerWidget {
  final FootballLiveScoreResponse footballLiveScoreResponse;
  final int teamId;
  TeamInfoView(
      {super.key,
      required this.teamId,
      required this.footballLiveScoreResponse});

  final txtStyle = TextStyle(fontSize: 20.sp, letterSpacing: 1.w);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final teamData = ref.watch(teamInfoProvider(teamId));
    final themeData = ref.watch(themeProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Team Info', style: TextStyle(letterSpacing: 1.w)),
      ),
      body: teamData.when(
        data: (data) {
          return RefreshIndicator(
            color: Colors.black,
            backgroundColor: Colors.white,
            onRefresh: () async {
              ref.invalidate(teamInfoProvider(teamId));
            },
            child: data.isEmpty
                ? const Center(child: Text('No Data Available'))
                : ListView.builder(
                    padding: EdgeInsets.symmetric(vertical: 2.w),
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      final teamInfo = data[index];
                      final coachName = teamInfo.coaches
                          .map((e) => e.coach_name)
                          .toList()
                          .join(', ');
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            if (teamData.isRefreshing)
                              LinearProgressIndicator(
                                backgroundColor: Colors.transparent,
                                minHeight: 2.5.w,
                                color: Colors.black,
                              ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 8.w),
                              child: teamInfo.team_logo.trim().isEmpty
                                  ? Image.asset('assets/icons/football.png',
                                      width: 100.w, height: 100.h)
                                  : Image.network(teamInfo.team_logo,
                                      width: 100.w, height: 100.h),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 6.w),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(
                                      child: Text(teamInfo.team_name,
                                          style: txtStyle)),
                                  if (coachName.trim().isNotEmpty)
                                    Flexible(
                                        child: Text('Coach - $coachName',
                                            style: txtStyle)),
                                ],
                              ),
                            ),
                            teamInfo.players.isEmpty
                                ? const Text('No Data Available')
                                : ListView.builder(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 2.w),
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: teamInfo.players.length,
                                    itemBuilder: (context, playerIndex) {
                                      final playerInfo =
                                          teamInfo.players[playerIndex];
                                      return Padding(
                                        padding:
                                            EdgeInsets.symmetric(vertical: 3.w),
                                        child: GestureDetector(
                                          onTap: () {
                                            Navigator.of(context).push(
                                                CupertinoPageRoute(
                                                    builder: (context) {
                                              return PlayerInfoView(
                                                  playerKey:
                                                      playerInfo.player_key);
                                            }));
                                          },
                                          child: Card(
                                            color: themeData
                                                .themeData.colorScheme.primary,
                                            surfaceTintColor: themeData
                                                .themeData.colorScheme.primary,
                                            elevation: 2.w,
                                            child: Padding(
                                              padding: EdgeInsets.all(10.w),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Flexible(
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(playerInfo
                                                            .player_name),
                                                        Text(
                                                            'Age : ${playerInfo.player_age}'),
                                                        Text(
                                                            'Player Type : ${playerInfo.player_type}'),
                                                        Text(
                                                            'Player Number : ${playerInfo.player_number}'),
                                                        if (playerInfo
                                                            .player_rating
                                                            .trim()
                                                            .isNotEmpty)
                                                          Text(
                                                              'Player Rating : ${playerInfo.player_rating}'),
                                                      ],
                                                    ),
                                                  ),
                                                  playerInfo.player_image
                                                          .trim()
                                                          .isEmpty
                                                      ? CircleAvatar(
                                                          radius: 34.w,
                                                          backgroundImage:
                                                              const AssetImage(
                                                                  'assets/icons/football.png'),
                                                        )
                                                      : CircleAvatar(
                                                          radius: 34.w,
                                                          backgroundImage:
                                                              NetworkImage(
                                                            playerInfo
                                                                .player_image,
                                                          ),
                                                        )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    })
                          ],
                        ),
                      );
                    }),
          );
        },
        error: (err, stack) => Center(
          child: Text(err.toString()),
        ),
        loading: () => const Center(
          child: CustomCircularLoading(),
        ),
      ),
    );
  }
}
