import 'package:sports_app/features/basketball/data/model/basketball_live_score_response.dart';

class BasketballLiveScoreState {
  final bool isLoad;
  final bool isError;
  final String errorMessage;
  final List<BasketballLiveScoreResponse> basketballLiveScore;

  BasketballLiveScoreState({
    required this.isLoad,
    required this.isError,
    required this.errorMessage,
    required this.basketballLiveScore,
  });

  BasketballLiveScoreState copyWith({
    bool? isLoad,
    bool? isError,
    String? errorMessage,
    List<BasketballLiveScoreResponse>? basketballLiveScore,
  }) {
    return BasketballLiveScoreState(
      isLoad: isLoad ?? this.isLoad,
      isError: isError ?? this.isError,
      errorMessage: errorMessage ?? this.errorMessage,
      basketballLiveScore: basketballLiveScore ?? this.basketballLiveScore,
    );
  }
}
