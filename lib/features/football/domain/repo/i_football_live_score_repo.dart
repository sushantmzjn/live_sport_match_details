import 'package:dartz/dartz.dart';
import 'package:sports_app/features/football/data/model/football_live_score_response.dart';

abstract class FootballLiveScoreRepo {
  Future<Either<String, List<FootballLiveScoreResponse>>>
      getFootballLiveScore();
}
