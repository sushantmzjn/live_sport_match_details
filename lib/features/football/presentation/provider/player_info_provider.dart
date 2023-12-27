import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sports_app/features/football/data/model/player_info_response.dart';
import 'package:sports_app/network/api.dart';
import 'package:sports_app/network/end_points.dart';

final playerInfoProvider = FutureProvider.family((ref, int playerId) =>
    PlayerInfoProvider.getPlayerInfo(playerId: playerId));

class PlayerInfoProvider {
  static Future<List<PlayerInfo>> getPlayerInfo({required int playerId}) async {
    try {
      final res = await API().get(EndPoint.getFootballScore,
          useToken: false,
          queryParameters: {
            'met': 'Players',
            'APIkey': apiKey,
            'playerId': playerId
          });
      final data = (res.data['result'] as List)
          .map((e) => PlayerInfo.fromJson(e))
          .toList();

      return data;
    } on DioException catch (e) {
      if (e.response != null) {
        debugPrint(
            'Error in getting data ${e.response!.statusCode} : ${e.response!.statusMessage}');
      } else {
        debugPrint('Error in getting data: ${e.message}');
      }
      throw ('${e.message}');
    }
  }
}
