// ignore_for_file: non_constant_identifier_names

class FootballLiveScoreResponse {
  String event_date;
  String event_time;
  String event_home_team;
  String event_away_team;
  String event_final_result;
  String event_status;
  String league_name;
  String event_stadium;
  String home_team_logo;
  String away_team_logo;
  String event_home_formation;
  String event_away_formation;
  int home_team_key;
  int away_team_key;
  List<GoalScorers> goalscorers;
  List<Statistics> statistics;
  List<Cards> cards;
  List<Substitutes> substitutes;
  String msg;

  FootballLiveScoreResponse(
      {required this.event_date,
      required this.event_time,
      required this.event_home_team,
      required this.event_away_team,
      required this.event_final_result,
      required this.event_status,
      required this.league_name,
      required this.event_stadium,
      required this.home_team_logo,
      required this.away_team_logo,
      required this.event_home_formation,
      required this.event_away_formation,
      required this.goalscorers,
      required this.statistics,
      required this.substitutes,
      required this.cards,
      required this.home_team_key,
      required this.away_team_key,
      required this.msg});

  factory FootballLiveScoreResponse.fromJson(Map<String, dynamic> json) {
    return FootballLiveScoreResponse(
      msg: json['msg'] ?? '',
      event_date: json['event_date'] ?? '',
      event_time: json['event_time'] ?? '',
      event_home_team: json['event_home_team'] ?? '',
      event_away_team: json['event_away_team'] ?? '',
      event_final_result: json['event_final_result'] ?? '',
      event_status: json['event_status'] ?? '',
      league_name: json['league_name'] ?? '',
      event_stadium: json['event_stadium'] ?? '',
      home_team_logo: json['home_team_logo'] ?? '',
      away_team_logo: json['away_team_logo'] ?? '',
      event_home_formation: json['event_home_formation'] ?? '',
      event_away_formation: json['event_away_formation'] ?? '',
      home_team_key: json['home_team_key'] ?? 0,
      away_team_key: json['away_team_key'] ?? 0,
      goalscorers: (json['goalscorers']) != null
          ? List<GoalScorers>.from(
              json['goalscorers'].map((e) => GoalScorers.fromJson(e)))
          : [],
      statistics: (json['statistics']) != null
          ? List<Statistics>.from(
              json['statistics'].map((e) => Statistics.fromJson(e)))
          : [],
      cards: (json['cards']) != null
          ? List<Cards>.from(json['cards'].map((e) => Cards.fromJson(e)))
          : [],
      substitutes: (json['substitutes']) != null
          ? List<Substitutes>.from(
              json['substitutes'].map((e) => Substitutes.fromJson(e)))
          : [],
    );
  }
}

class Substitutes {
  String time;
  AwaySubstitutes awaySubstitutes;
  HomeSubstitutes homeSubstitutes;

  Substitutes({
    required this.time,
    required this.awaySubstitutes,
    required this.homeSubstitutes,
  });

  factory Substitutes.fromJson(Map<String, dynamic> json) {
    return Substitutes(
      time: json['time'] ?? '',
      awaySubstitutes: parseAwaySubstitutes(json['away_scorer']),
      homeSubstitutes: parseHomeSubstitutes(json['home_scorer']),
    );
  }

  static AwaySubstitutes parseAwaySubstitutes(dynamic json) {
    if (json is List) {
      // Decide what to do when it's a list (e.g., return null or create a default instance)
      return AwaySubstitutes(
          awayIn: '',
          awayOut: ''); // Replace this line with your desired behavior
    } else {
      return AwaySubstitutes.fromJson(json ?? {});
    }
  }

  static HomeSubstitutes parseHomeSubstitutes(dynamic json) {
    if (json is List) {
      // Decide what to do when it's a list (e.g., return null or create a default instance)
      return HomeSubstitutes(
          homeIn: '',
          homeOut: ''); // Replace this line with your desired behavior
    } else {
      return HomeSubstitutes.fromJson(json ?? {});
    }
  }
}

class HomeSubstitutes {
  String homeIn;
  String homeOut;

  HomeSubstitutes({required this.homeIn, required this.homeOut});

  factory HomeSubstitutes.fromJson(Map<String, dynamic> json) {
    return HomeSubstitutes(
      homeIn: json['in'] ?? '',
      homeOut: json['out'] ?? '',
    );
  }
}

class AwaySubstitutes {
  String awayIn;
  String awayOut;

  AwaySubstitutes({required this.awayIn, required this.awayOut});

  factory AwaySubstitutes.fromJson(Map<String, dynamic> json) {
    return AwaySubstitutes(
      awayIn: json['in'] ?? '',
      awayOut: json['out'] ?? '',
    );
  }
}

class GoalScorers {
  String time;
  String home_scorer;
  String home_assist;
  String away_scorer;
  String away_assist;
  String info;

  GoalScorers({
    required this.time,
    required this.home_scorer,
    required this.home_assist,
    required this.away_scorer,
    required this.away_assist,
    required this.info,
  });

  factory GoalScorers.fromJson(Map<String, dynamic> json) {
    return GoalScorers(
      time: json['time'] ?? '',
      home_scorer: json['home_scorer'] ?? '',
      home_assist: json['home_assist'] ?? '',
      away_scorer: json['away_scorer'] ?? '',
      away_assist: json['away_assist'] ?? '',
      info: json['info'] ?? '',
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

class Cards {
  String time;
  String home_fault;
  String away_fault;
  String card;

  Cards(
      {required this.time,
      required this.home_fault,
      required this.away_fault,
      required this.card});

  factory Cards.fromJson(Map<String, dynamic> json) {
    return Cards(
        time: json['time'] ?? '',
        home_fault: json['home_fault'] ?? '',
        away_fault: json['away_fault'] ?? '',
        card: json['card'] ?? '');
  }
}
