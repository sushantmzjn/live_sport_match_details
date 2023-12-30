import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sports_app/features/tennis/data/repo/tennis_live_score_repo_impl.dart';
import 'package:sports_app/features/tennis/presentation/provider/state/tennis_live_score_state.dart';

final tennisLiveScoreProvider =
    StateNotifierProvider<TennisLiveScoreProvider, TennisLiveScoreState>(
        (ref) => TennisLiveScoreProvider(
              TennisLiveScoreState(
                  isLoad: false,
                  isError: false,
                  errorMessage: '',
                  tennisLiveScore: []),
            ));

class TennisLiveScoreProvider extends StateNotifier<TennisLiveScoreState> {
  TennisLiveScoreProvider(super.state) {
    getTennisLiveScore();
  }

  Future<void> getTennisLiveScore() async {
    state = state.copyWith(isLoad: true, isError: false, errorMessage: '');
    final res = await TennisLiveScoreRepoImpl().getTennisLiveScore();

    res.fold(
      (l) =>
          state = state.copyWith(isLoad: false, isError: true, errorMessage: l),
      (r) => state = state.copyWith(
          isLoad: false, isError: false, errorMessage: '', tennisLiveScore: r),
    );
  }
}
