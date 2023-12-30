import 'package:dartz/dartz.dart';
import 'package:sports_app/features/tennis/data/model/tennis_live_score_response.dart';

abstract class TennisRepo {
  Future<Either<String, List<TennisLiveScoreResponse>>> getTennisLiveScore();
}
