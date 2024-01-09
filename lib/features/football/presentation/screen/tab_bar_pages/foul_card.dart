import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sports_app/config/theme/theme_provider.dart';
import 'package:sports_app/features/football/data/model/football_live_score_response.dart';

class FoulCard extends ConsumerWidget {
  final FootballLiveScoreResponse footballData;
  const FoulCard({super.key, required this.footballData});

  @override
  Widget build(BuildContext context, ref) {
    final themeData = ref.watch(themeProvider);

    return footballData.cards.isEmpty
        ? const Center(child: Text('No Data Available'))
        : ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.w),
            itemCount: footballData.cards.length,
            itemBuilder: (context, index) {
              final cardData = footballData.cards[index];
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 2.w),
                child: Card(
                  elevation: 3.w,
                  color: themeData.themeData.colorScheme.primary,
                  surfaceTintColor: themeData.themeData.colorScheme.primary,
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 6.w, horizontal: 8.w),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (cardData.home_fault.trim().isNotEmpty)
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(cardData.home_fault),
                                Image.asset(
                                  'assets/icons/cards.png',
                                  height: 30.h,
                                  width: 30.w,
                                  color: cardData.card == 'yellow card'
                                      ? Colors.yellowAccent
                                      : Colors.red,
                                )
                              ],
                            ),
                          ),
                        if (cardData.away_fault.trim().isNotEmpty)
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(cardData.away_fault),
                                Image.asset(
                                  'assets/icons/cards.png',
                                  height: 30.h,
                                  width: 30.w,
                                  color: cardData.card == 'yellow card'
                                      ? Colors.yellowAccent
                                      : Colors.red,
                                )
                              ],
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              );
            });
  }
}
