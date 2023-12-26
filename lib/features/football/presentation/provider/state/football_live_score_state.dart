import 'package:sports_app/features/football/data/model/football_live_score_response.dart';

class FootballLiveScoreState {
  final bool isLoad;
  final bool isError;
  final String errorMessage;
  final List<FootballLiveScoreResponse> footballLiveScore;

  FootballLiveScoreState({
    required this.isLoad,
    required this.isError,
    required this.errorMessage,
    required this.footballLiveScore,
  });

  FootballLiveScoreState copyWith({
    bool? isLoad,
    bool? isError,
    String? errorMessage,
    List<FootballLiveScoreResponse>? footballLiveScore,
  }) {
    return FootballLiveScoreState(
      isLoad: isLoad ?? this.isLoad,
      isError: isError ?? this.isError,
      errorMessage: errorMessage ?? this.errorMessage,
      footballLiveScore: footballLiveScore ?? this.footballLiveScore,
    );
  }
}
