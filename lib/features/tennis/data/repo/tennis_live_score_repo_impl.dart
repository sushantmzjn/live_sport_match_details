import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:sports_app/features/tennis/data/model/tennis_live_score_response.dart';
import 'package:sports_app/features/tennis/domain/repo/i_tennis_live_score_repo.dart';
import 'package:sports_app/network/api.dart';
import 'package:sports_app/network/end_points.dart';

class TennisLiveScoreRepoImpl implements TennisRepo {
  @override
  Future<Either<String, List<TennisLiveScoreResponse>>>
      getTennisLiveScore() async {
    try {
      final res = await API()
          .get(EndPoint.getTennisScore, useToken: false, queryParameters: {
        'met': 'Livescore',
        'APIkey': apiKey,
      });
      if (res.data['result'] == null) {
        return const Left('No Live Matches Right Now');
      } else {
        final data = (res.data['result'] as List)
            .map((e) => TennisLiveScoreResponse.fromJson(e))
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
