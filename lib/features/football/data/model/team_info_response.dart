// ignore_for_file: non_constant_identifier_names

class TeamInfoResponse {
  int team_key;
  String team_name;
  String team_logo;
  List<Players> players;
  List<Coach> coaches;

  TeamInfoResponse({
    required this.team_key,
    required this.team_name,
    required this.team_logo,
    required this.players,
    required this.coaches,
  });

  factory TeamInfoResponse.fromJson(Map<String, dynamic> json) {
    return TeamInfoResponse(
      team_key: json['team_key'] ?? 0,
      team_name: json['team_name'] ?? '',
      team_logo: json['team_logo'] ?? '',
      players: (json['players']) != null
          ? List<Players>.from(json['players'].map((e) => Players.fromJson(e)))
          : [],
      coaches: (json['coaches']) != null
          ? List<Coach>.from(json['coaches'].map((e) => Coach.fromJson(e)))
          : [],
    );
  }
}

class Coach {
  String coach_name;
  String coach_country;
  String coach_age;

  Coach(
      {required this.coach_name,
      required this.coach_country,
      required this.coach_age});

  factory Coach.fromJson(Map<String, dynamic> json) {
    return Coach(
      coach_name: json['coach_name'] ?? '',
      coach_country: json['coach_country'] ?? '',
      coach_age: json['coach_age'] ?? '',
    );
  }
}

class Players {
  int player_key;
  String player_image;
  String player_name;
  String player_number;
  String player_country;
  String player_type;
  String player_age;
  String player_match_played;
  String player_goals;
  String player_yellow_cards;
  String player_red_cards;
  String player_injured;
  String player_assists;
  String player_is_captain;
  String player_shots_total;
  String player_rating;

  Players({
    required this.player_key,
    required this.player_image,
    required this.player_name,
    required this.player_number,
    required this.player_country,
    required this.player_type,
    required this.player_age,
    required this.player_match_played,
    required this.player_goals,
    required this.player_yellow_cards,
    required this.player_red_cards,
    required this.player_injured,
    required this.player_assists,
    required this.player_is_captain,
    required this.player_shots_total,
    required this.player_rating,
  });

  factory Players.fromJson(Map<String, dynamic> json) {
    return Players(
      player_key: json['player_key'] ?? 0,
      player_image: json['player_image'] ?? '',
      player_name: json['player_name'] ?? '',
      player_number: json['player_number'] ?? '',
      player_country: json['player_country'] ?? '',
      player_type: json['player_type'] ?? '',
      player_age: json['player_age'] ?? '',
      player_match_played: json['player_match_played'] ?? '',
      player_goals: json['player_goals'] ?? '',
      player_yellow_cards: json['player_yellow_cards'] ?? '',
      player_red_cards: json['player_red_cards'] ?? '',
      player_injured: json['player_injured'] ?? '',
      player_assists: json['player_assists'] ?? '',
      player_is_captain: json['player_is_captain'] ?? '',
      player_shots_total: json['player_shots_total'] ?? '',
      player_rating: json['player_rating'] ?? '',
    );
  }
}
