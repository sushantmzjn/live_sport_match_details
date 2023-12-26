import 'package:dartz/dartz.dart';
import 'package:sports_app/features/basketball/data/model/basketball_live_score_response.dart';

abstract class BasketballLiveScoreRepo {
  Future<Either<String, List<BasketballLiveScoreResponse>>>
      getBasketballLiveScore();
}
