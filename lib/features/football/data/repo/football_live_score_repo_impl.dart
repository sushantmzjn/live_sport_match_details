import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:sports_app/features/football/data/model/football_live_score_response.dart';
import 'package:sports_app/features/football/domain/repo/i_football_live_score_repo.dart';
import 'package:sports_app/network/api.dart';
import 'package:sports_app/network/end_points.dart';

class FootballLiveScoreRepoImpl implements FootballLiveScoreRepo {
  @override
  Future<Either<String, List<FootballLiveScoreResponse>>>
      getFootballLiveScore() async {
    try {
      final response = await API()
          .get(EndPoint.getFootballScore, useToken: false, queryParameters: {
        'met': 'Livescore',
        'APIkey': apiKey,
      });
      if (response.data['result'] == null) {
        return const Left('No Live Matches Right Now');
      } else {
        final data = (response.data['result'] as List)
            .map((e) => FootballLiveScoreResponse.fromJson(e))
            .toList();

        return Right(data);
      }
    } on DioException catch (e) {
      if (e.response != null) {
        debugPrint(
            'Error in getting data ${e.response!.statusCode} : ${e.response!.statusMessage}');
        Left('${e.response!.statusMessage}');
      } else {
        debugPrint('Error in getting data: ${e.message}');
      }
      throw Left('${e.message}');
    }
  }
}
