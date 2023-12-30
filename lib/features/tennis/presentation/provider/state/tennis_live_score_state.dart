import 'package:sports_app/features/tennis/data/model/tennis_live_score_response.dart';

class TennisLiveScoreState {
  final bool isLoad;
  final bool isError;
  final String errorMessage;
  final List<TennisLiveScoreResponse> tennisLiveScore;

  TennisLiveScoreState({
    required this.isLoad,
    required this.isError,
    required this.errorMessage,
    required this.tennisLiveScore,
  });

  TennisLiveScoreState copyWith({
    bool? isLoad,
    bool? isError,
    String? errorMessage,
    List<TennisLiveScoreResponse>? tennisLiveScore,
  }) {
    return TennisLiveScoreState(
      isLoad: isLoad ?? this.isLoad,
      isError: isError ?? this.isError,
      errorMessage: errorMessage ?? this.errorMessage,
      tennisLiveScore: tennisLiveScore ?? this.tennisLiveScore,
    );
  }
}
