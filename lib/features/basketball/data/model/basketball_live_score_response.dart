// ignore_for_file: non_constant_identifier_names

class BasketballLiveScoreResponse {
  int event_key;
  String event_date;
  String event_time;
  String event_home_team;
  String event_away_team;
  String event_final_result;
  String event_quarter;
  String event_status;
  String country_name;
  String league_name;
  int league_key;
  String league_season;
  String event_home_team_logo;
  String event_away_team_logo;
  Scores scores;
  List<Statistics> statistics;

  BasketballLiveScoreResponse(
      {required this.event_key,
      required this.event_date,
      required this.event_time,
      required this.event_home_team,
      required this.event_away_team,
      required this.country_name,
      required this.league_name,
      required this.league_key,
      required this.league_season,
      required this.event_quarter,
      required this.event_status,
      required this.event_final_result,
      required this.event_away_team_logo,
      required this.event_home_team_logo,
      required this.scores,
      required this.statistics});

  factory BasketballLiveScoreResponse.fromJson(Map<String, dynamic> json) {
    return BasketballLiveScoreResponse(
      event_key: json['event_key'] ?? 0,
      event_date: json['event_date'] ?? '',
      event_time: json['event_time'] ?? '',
      event_home_team: json['event_home_team'] ?? '',
      event_away_team: json['event_away_team'] ?? '',
      country_name: json['country_name'] ?? '',
      league_name: json['league_name'] ?? '',
      league_key: json['league_key'] ?? 0,
      league_season: json['league_season'] ?? '',
      event_quarter: json['event_quarter'] ?? '',
      event_status: json['event_status'] ?? '',
      event_final_result: json['event_final_result'] ?? '',
      event_away_team_logo: json['event_away_team_logo'] ?? '',
      event_home_team_logo: json['event_home_team_logo'] ?? '',
      scores: Scores.fromJson(json['scores'] ?? {}),
      statistics: (json['statistics']) != null
          ? List<Statistics>.from(
              json['statistics'].map((e) => Statistics.fromJson(e)))
          : [],
    );
  }
}

class Statistics {
  String type;
  String home;
  String away;

  Statistics({
    required this.type,
    required this.home,
    required this.away,
  });

  factory Statistics.fromJson(Map<String, dynamic> json) {
    return Statistics(
      type: json['type'] ?? '',
      home: json['home'] ?? '',
      away: json['away'] ?? '',
    );
  }
}

class Scores {
  List<FirstQuarter> firstQuarter;
  List<SecondQuarter> secondQuarter;
  List<ThirdQuarter> thirdQuarter;
  List<FourthQuarter> fourthQuarter;

  Scores(
      {required this.firstQuarter,
      required this.secondQuarter,
      required this.thirdQuarter,
      required this.fourthQuarter});

  factory Scores.fromJson(Map<String, dynamic> json) {
    return Scores(
        firstQuarter: (json['1stQuarter']) != null
            ? List<FirstQuarter>.from(
                json['1stQuarter'].map((e) => FirstQuarter.fromJson(e)))
            : [],
        secondQuarter: (json['2ndQuarter']) != null
            ? List<SecondQuarter>.from(
                json['2ndQuarter'].map((e) => SecondQuarter.fromJson(e)))
            : [],
        thirdQuarter: (json['3rdQuarter']) != null
            ? List<ThirdQuarter>.from(
                json['3rdQuarter'].map((e) => ThirdQuarter.fromJson(e)))
            : [],
        fourthQuarter: (json['4thQuarter']) != null
            ? List<FourthQuarter>.from(
                json['4thQuarter'].map((e) => FourthQuarter.fromJson(e)))
            : []);
  }
}

//----------score quarter
class FirstQuarter {
  String score_home;
  String score_away;

  FirstQuarter({required this.score_home, required this.score_away});

  factory FirstQuarter.fromJson(Map<String, dynamic> json) {
    return FirstQuarter(
        score_home: json['score_home'] ?? '0',
        score_away: json['score_away'] ?? '0');
  }
}

class SecondQuarter {
  String score_home;
  String score_away;

  SecondQuarter({required this.score_home, required this.score_away});

  factory SecondQuarter.fromJson(Map<String, dynamic> json) {
    return SecondQuarter(
        score_home: json['score_home'] ?? '0',
        score_away: json['score_away'] ?? '0');
  }
}

class ThirdQuarter {
  String score_home;
  String score_away;

  ThirdQuarter({required this.score_home, required this.score_away});

  factory ThirdQuarter.fromJson(Map<String, dynamic> json) {
    return ThirdQuarter(
        score_home: json['score_home'] ?? '0',
        score_away: json['score_away'] ?? '0');
  }
}

class FourthQuarter {
  String score_home;
  String score_away;

  FourthQuarter({required this.score_home, required this.score_away});

  factory FourthQuarter.fromJson(Map<String, dynamic> json) {
    return FourthQuarter(
        score_home: json['score_home'] ?? '0',
        score_away: json['score_away'] ?? '0');
  }
}
