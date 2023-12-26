import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sports_app/features/football/data/model/football_live_score_response.dart';

class SubstitutesView extends StatelessWidget {
  final FootballLiveScoreResponse footballData;
  const SubstitutesView({super.key, required this.footballData});

  @override
  Widget build(BuildContext context) {
    return footballData.substitutes.isEmpty
        ? const Center(
            child: Text('No Data Available'),
          )
        : ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.w),
            itemCount: footballData.substitutes.length,
            itemBuilder: (context, index) {
              final substitutesData = footballData.substitutes[index];
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 2.w),
                child: Card(
                  color: Colors.white,
                  surfaceTintColor: Colors.white,
                  elevation: 3.w,
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 8.w, horizontal: 12.w),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (substitutesData.homeSubstitutes.homeIn
                            .trim()
                            .isNotEmpty)
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(substitutesData.homeSubstitutes.homeIn),
                                const Text('In',
                                    style: TextStyle(color: Colors.green)),
                              ],
                            ),
                          ),
                        if (substitutesData.homeSubstitutes.homeIn
                                .trim()
                                .isNotEmpty &&
                            substitutesData.homeSubstitutes.homeOut
                                .trim()
                                .isNotEmpty)
                          Divider(
                            color: Colors.black.withOpacity(0.2),
                            thickness: 0.8.w,
                          ),
                        if (substitutesData.homeSubstitutes.homeOut
                            .trim()
                            .isNotEmpty)
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(substitutesData.homeSubstitutes.homeOut),
                                const Text('Out',
                                    style: TextStyle(color: Colors.red)),
                              ],
                            ),
                          ),

                        //------------------away ----------
                        if (substitutesData.awaySubstitutes.awayIn
                            .trim()
                            .isNotEmpty)
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(substitutesData.awaySubstitutes.awayIn),
                                const Text('In',
                                    style: TextStyle(color: Colors.green)),
                              ],
                            ),
                          ),
                        if (substitutesData.awaySubstitutes.awayIn
                                .trim()
                                .isNotEmpty &&
                            substitutesData.awaySubstitutes.awayOut
                                .trim()
                                .isNotEmpty)
                          Divider(
                            color: Colors.black.withOpacity(0.2),
                            thickness: 0.8.w,
                          ),
                        if (substitutesData.awaySubstitutes.awayOut
                            .trim()
                            .isNotEmpty)
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(substitutesData.awaySubstitutes.awayOut),
                                const Text('Out',
                                    style: TextStyle(color: Colors.red)),
                              ],
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
  }
}
