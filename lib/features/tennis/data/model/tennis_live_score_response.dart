// ignore_for_file: non_constant_identifier_names

class TennisLiveScoreResponse {
  int event_key;
  int home_team_key;
  int away_team_key;
  String event_home_team;
  String event_away_team;
  String event_service_home;
  String event_service_away;
  String event_home_final_result;
  String event_away_final_result;
  String event_home_rr;
  String event_away_rr;
  String event_status;
  String event_status_info;
  String league_name;
  int league_key;
  String league_round;
  String league_season;
  String event_live;
  String event_type;
  String event_toss;
  String event_man_of_match;
  String event_stadium;
  String event_home_team_logo;
  String event_away_team_logo;

  TennisLiveScoreResponse({
    required this.event_key,
    required this.home_team_key,
    required this.away_team_key,
    required this.event_home_team,
    required this.event_away_team,
    required this.event_service_home,
    required this.event_service_away,
    required this.event_home_final_result,
    required this.event_away_final_result,
    required this.event_home_rr,
    required this.event_away_rr,
    required this.event_status,
    required this.event_status_info,
    required this.league_name,
    required this.league_key,
    required this.league_round,
    required this.league_season,
    required this.event_live,
    required this.event_type,
    required this.event_toss,
    required this.event_man_of_match,
    required this.event_stadium,
    required this.event_home_team_logo,
    required this.event_away_team_logo,
  });

  factory TennisLiveScoreResponse.fromJson(Map<String, dynamic> json) {
    return TennisLiveScoreResponse(
      event_key: json['event_key'],
      home_team_key: json['home_team_key'],
      away_team_key: json['away_team_key'],
      event_home_team: json['event_home_team'],
      event_away_team: json['event_away_team'],
      event_service_home: json['event_service_home'],
      event_service_away: json['event_service_away'],
      event_home_final_result: json['event_home_final_result'],
      event_away_final_result: json['event_away_final_result'],
      event_home_rr: json['event_home_rr'],
      event_away_rr: json['event_away_rr'],
      event_status: json['event_status'],
      event_status_info: json['event_status_info'],
      league_name: json['league_name'],
      league_key: json['league_key'],
      league_round: json['league_round'],
      league_season: json['league_season'],
      event_live: json['event_live'],
      event_type: json['event_type'],
      event_toss: json['event_toss'],
      event_man_of_match: json['event_man_of_match'],
      event_stadium: json['event_stadium'],
      event_home_team_logo: json['event_home_team_logo'],
      event_away_team_logo: json['event_away_team_logo'],
    );
  }
}
