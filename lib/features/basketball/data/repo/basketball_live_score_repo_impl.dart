import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:sports_app/features/basketball/data/model/basketball_live_score_response.dart';
import 'package:sports_app/features/basketball/domain/repo/i_basketball_live_score_repo.dart';
import 'package:sports_app/network/api.dart';
import 'package:sports_app/network/end_points.dart';

class BasketballLiveScoreImpl implements BasketballLiveScoreRepo {
  @override
  Future<Either<String, List<BasketballLiveScoreResponse>>>
      getBasketballLiveScore() async {
    try {
      final response = await API()
          .get(EndPoint.getBasketballScore, useToken: false, queryParameters: {
        'met': 'Livescore',
        'APIkey': apiKey,
      });
      if (response.data['result'] == null) {
        return const Left('No Live Matches Right Now');
      } else {
        final data = (response.data['result'] as List)
            .map((e) => BasketballLiveScoreResponse.fromJson(e))
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
