import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sports_app/features/football/data/repo/football_live_score_repo_impl.dart';
import 'package:sports_app/features/football/presentation/provider/state/football_live_score_state.dart';

final footballLiveScoreDataProvider =
    StateNotifierProvider<FootballLiveScoreProvider, FootballLiveScoreState>(
        (ref) => FootballLiveScoreProvider(
              FootballLiveScoreState(
                isLoad: false,
                isError: false,
                errorMessage: '',
                footballLiveScore: [],
              ),
            ));

class FootballLiveScoreProvider extends StateNotifier<FootballLiveScoreState> {
  FootballLiveScoreProvider(super.state) {
    getFootballLivescore();
  }

  Future<void> getFootballLivescore() async {
    state = state.copyWith(isLoad: true, isError: false, errorMessage: '');
    final res = await FootballLiveScoreRepoImpl().getFootballLiveScore();

    res.fold(
      (l) =>
          state = state.copyWith(isLoad: false, isError: true, errorMessage: l),
      (r) => state = state.copyWith(
          isLoad: false,
          isError: false,
          errorMessage: '',
          footballLiveScore: r),
    );
  }
}
