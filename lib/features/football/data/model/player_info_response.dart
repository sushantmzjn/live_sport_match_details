// ignore_for_file: non_constant_identifier_names

class PlayerInfo {
  String player_name;
  String player_number;
  String player_country;
  String player_type;
  String player_age;
  String player_match_played;
  String player_goals;
  String player_yellow_cards;
  String player_red_cards;
  String player_pen_scored;
  String player_passes_accuracy;
  String player_rating;
  String team_name;
  String player_image;

  PlayerInfo({
    required this.player_name,
    required this.player_number,
    required this.player_country,
    required this.player_type,
    required this.player_age,
    required this.player_match_played,
    required this.player_goals,
    required this.player_yellow_cards,
    required this.player_red_cards,
    required this.player_pen_scored,
    required this.player_passes_accuracy,
    required this.player_rating,
    required this.team_name,
    required this.player_image,
  });

  factory PlayerInfo.fromJson(Map<String, dynamic> json) {
    return PlayerInfo(
      player_name: json['player_name'] ?? '',
      player_number: json['player_number'] ?? '',
      player_country: json['player_country'] ?? '',
      player_type: json['player_type'] ?? '',
      player_age: json['player_age'] ?? '',
      player_match_played: json['player_match_played'] ?? '',
      player_goals: json['player_goals'] ?? '',
      player_yellow_cards: json['player_yellow_cards'] ?? '',
      player_red_cards: json['player_red_cards'] ?? '',
      player_pen_scored: json['player_pen_scored'] ?? '',
      player_passes_accuracy: json['player_passes_accuracy'] ?? '',
      player_rating: json['player_rating'] ?? '',
      team_name: json['team_name'] ?? '',
      player_image: json['player_image'] ?? '',
    );
  }
}
