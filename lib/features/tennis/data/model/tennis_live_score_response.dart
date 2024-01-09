// ignore_for_file: non_constant_identifier_names

class TennisLiveScoreResponse {
  int event_key;
  int first_player_key;
  int second_player_key;
  String event_first_player;
  String event_second_player;
  String event_final_result;
  String event_game_result;
  String event_serve;
  String event_winner;
  String event_status;
  String country_name;
  String league_name;
  int league_key;
  String league_round;
  String league_season;
  String event_live;
  String event_first_player_logo;
  String event_second_player_logo;
  List<PointByPoint> pointbypoint;
  String msg;

  TennisLiveScoreResponse({
    required this.event_key,
    required this.country_name,
    required this.event_final_result,
    required this.event_first_player,
    required this.event_second_player,
    required this.event_first_player_logo,
    required this.event_game_result,
    required this.event_live,
    required this.event_second_player_logo,
    required this.event_serve,
    required this.event_status,
    required this.event_winner,
    required this.first_player_key,
    required this.league_key,
    required this.league_name,
    required this.league_round,
    required this.league_season,
    required this.second_player_key,
    required this.pointbypoint,
    required this.msg,
  });

  factory TennisLiveScoreResponse.fromJson(Map<String, dynamic> json) {
    return TennisLiveScoreResponse(
        event_key: json['event_key'] ?? 0,
        msg: json['msg'] ?? '',
        country_name: json['country_name'] ?? '',
        event_final_result: json['event_final_result'] ?? '',
        event_first_player: json['event_first_player'] ?? '',
        event_second_player: json['event_second_player'] ?? '',
        event_first_player_logo: json['event_first_player_logo'] ?? '',
        event_game_result: json['event_game_result'] ?? '',
        event_live: json['event_live'] ?? '',
        event_second_player_logo: json['event_second_player_logo'] ?? '',
        event_serve: json['event_serve'] ?? '',
        event_status: json['event_status'] ?? '',
        event_winner: json['event_winner'] ?? '',
        first_player_key: json['first_player_key'] ?? 0,
        league_key: json['league_key'] ?? 0,
        league_name: json['league_name'] ?? '',
        league_round: json['league_round'] ?? '',
        league_season: json['league_season'] ?? '',
        second_player_key: json['second_player_key'] ?? 0,
        pointbypoint: (json['pointbypoint']) != null
            ? List<PointByPoint>.from(
                json['pointbypoint'].map((e) => PointByPoint.fromJson(e)))
            : []);
  }
}

class PointByPoint {
  String set_number;
  String number_game;
  String player_served;
  String serve_winner;
  String serve_lost;
  String score;
  List<Points> points;

  PointByPoint({
    required this.number_game,
    required this.player_served,
    required this.points,
    required this.score,
    required this.serve_lost,
    required this.serve_winner,
    required this.set_number,
  });
  factory PointByPoint.fromJson(Map<String, dynamic> json) {
    return PointByPoint(
      number_game: json['number_game'] ?? '',
      player_served: json['player_served'] ?? '',
      points: (json['points']) != null
          ? List<Points>.from(json['points'].map((e) => Points.fromJson(e)))
          : [],
      score: json['score'] ?? '',
      serve_lost: json['serve_lost'] ?? '',
      serve_winner: json['serve_winner'] ?? '',
      set_number: json['set_number'] ?? '',
    );
  }
}

class Points {
  String number_point;
  String score;
  String set_point;
  String match_point;

  Points({
    required this.match_point,
    required this.number_point,
    required this.score,
    required this.set_point,
  });

  factory Points.fromJson(Map<String, dynamic> json) {
    return Points(
        match_point: json['match_point'] ?? '',
        number_point: json['number_point'] ?? '',
        score: json['score'] ?? '',
        set_point: json['set_point'] ?? '');
  }
}
