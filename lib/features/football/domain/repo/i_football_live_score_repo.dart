import 'package:dartz/dartz.dart';
import 'package:sports_app/features/football/data/model/football_live_score_response.dart';
import 'package:sports_app/features/football/data/model/team_info_response.dart';

abstract class FootballLiveScoreRepo {
  Future<Either<String, List<FootballLiveScoreResponse>>>
      getFootballLiveScore();
}

// abstract class TeamInfoRepo {
//   Future<Either<String, List<TeamInfoResponse>>> getTeamInfo(
//       {required int teamId});
// }
