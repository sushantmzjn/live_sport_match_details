import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sports_app/features/football/data/model/team_info_response.dart';
import 'package:sports_app/network/api.dart';
import 'package:sports_app/network/end_points.dart';

final teamInfoProvider = FutureProvider.family(
    (ref, int teamId) => TeamInfoProvider.getTeamInfo(teamId: teamId));

class TeamInfoProvider {
  static Future<List<TeamInfoResponse>> getTeamInfo(
      {required int teamId}) async {
    try {
      final res = await API().get(EndPoint.getFootballScore,
          useToken: false,
          queryParameters: {
            'met': 'Teams',
            'APIkey': apiKey,
            'teamId': teamId
          });
      final data = (res.data['result'] as List)
          .map((e) => TeamInfoResponse.fromJson(e))
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
