import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sports_app/config/widgets/custom_loading.dart';
import 'package:sports_app/features/football/presentation/provider/player_info_provider.dart';
import 'package:sports_app/features/football/presentation/widgets/player_info_tile.dart';

class PlayerInfoView extends ConsumerWidget {
  final int playerKey;
  PlayerInfoView({super.key, required this.playerKey});
  final txtStyle = TextStyle(fontSize: 20.sp, letterSpacing: 1.w);
  final txtStyle1 = TextStyle(fontSize: 18.sp);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final playerInfoData = ref.watch(playerInfoProvider(playerKey));
    return Scaffold(
      appBar: AppBar(
          title: Text(
        'Player Info',
        style: txtStyle,
      )),
      body: playerInfoData.when(
        data: (data) {
          return RefreshIndicator(
            color: Colors.black,
            onRefresh: () async {
              ref.invalidate(playerInfoProvider(playerKey));
            },
            child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                itemCount: data.length,
                itemBuilder: (context, index) {
                  final playerData = data[index];
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 6.w),
                    child: Card(
                      surfaceTintColor: Colors.white,
                      color: Colors.white,
                      elevation: 3,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 8.w, horizontal: 10.w),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            if (playerInfoData.isRefreshing)
                              LinearProgressIndicator(
                                backgroundColor: Colors.transparent,
                                minHeight: 2.5.w,
                                color: Colors.black,
                              ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 2.w),
                              child: playerData.player_image.isEmpty
                                  ? CircleAvatar(
                                      radius: 50.r,
                                      backgroundImage: const AssetImage(
                                          'assets/icons/football.png'),
                                    )
                                  : CircleAvatar(
                                      radius: 50.r,
                                      backgroundImage:
                                          NetworkImage(playerData.player_image),
                                    ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 8.w, horizontal: 10.w),
                              child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                      'Team Name : ${playerData.team_name}',
                                      style: txtStyle1)),
                            ),
                            PlayerInfoTile(
                                title: 'Player Name',
                                subTitle: playerData.player_name),
                            Divider(
                              color: Colors.black.withOpacity(0.2),
                              thickness: 0.8.w,
                            ),
                            PlayerInfoTile(
                                title: 'Player Age',
                                subTitle: playerData.player_age),
                            Divider(
                              color: Colors.black.withOpacity(0.2),
                              thickness: 0.8.w,
                            ),
                            PlayerInfoTile(
                                title: 'Player Number',
                                subTitle: playerData.player_number),
                            Divider(
                              color: Colors.black.withOpacity(0.2),
                              thickness: 0.8.w,
                            ),
                            PlayerInfoTile(
                                title: 'Player Country',
                                subTitle: playerData.player_country),
                            Divider(
                              color: Colors.black.withOpacity(0.2),
                              thickness: 0.8.w,
                            ),
                            PlayerInfoTile(
                                title: 'Player Type',
                                subTitle: playerData.player_type),
                            Divider(
                              color: Colors.black.withOpacity(0.2),
                              thickness: 0.8.w,
                            ),
                            PlayerInfoTile(
                                title: 'Matched Played',
                                subTitle: playerData.player_match_played),
                            Divider(
                              color: Colors.black.withOpacity(0.2),
                              thickness: 0.8.w,
                            ),
                            PlayerInfoTile(
                                title: 'Player Goals',
                                subTitle: playerData.player_goals),
                            Divider(
                              color: Colors.black.withOpacity(0.2),
                              thickness: 0.8.w,
                            ),
                            PlayerInfoTile(
                                title: 'Yellow Cards',
                                subTitle: playerData.player_yellow_cards),
                            Divider(
                              color: Colors.black.withOpacity(0.2),
                              thickness: 0.8.w,
                            ),
                            PlayerInfoTile(
                                title: 'Red Cards',
                                subTitle: playerData.player_red_cards),
                            Divider(
                              color: Colors.black.withOpacity(0.2),
                              thickness: 0.8.w,
                            ),
                            PlayerInfoTile(
                                title: 'Penalty Scoreed',
                                subTitle: playerData.player_pen_scored),
                            Divider(
                              color: Colors.black.withOpacity(0.2),
                              thickness: 0.8.w,
                            ),
                            PlayerInfoTile(
                                title: 'Passes Accuracy',
                                subTitle: playerData.player_passes_accuracy),
                            Divider(
                              color: Colors.black.withOpacity(0.2),
                              thickness: 0.8.w,
                            ),
                            PlayerInfoTile(
                                title: 'Player Rating',
                                subTitle: playerData.player_rating),
                          ],
                        ),
                      ),
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
