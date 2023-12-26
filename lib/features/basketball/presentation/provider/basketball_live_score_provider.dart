import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sports_app/features/basketball/data/repo/basketball_live_score_repo_impl.dart';
import 'package:sports_app/features/basketball/presentation/provider/state/basketball_live_score_state.dart';

final basketballLiveScoreProvider = StateNotifierProvider<
        BasketballLiveScoreProvider, BasketballLiveScoreState>(
    (ref) => BasketballLiveScoreProvider(
          BasketballLiveScoreState(
            isLoad: false,
            isError: false,
            errorMessage: '',
            basketballLiveScore: [],
          ),
        ));

class BasketballLiveScoreProvider
    extends StateNotifier<BasketballLiveScoreState> {
  BasketballLiveScoreProvider(super.state) {
    getBasketballLiveScore();
  }

  Future<void> getBasketballLiveScore() async {
    state = state.copyWith(isLoad: true, isError: false, errorMessage: '');
    final res = await BasketballLiveScoreImpl().getBasketballLiveScore();
    res.fold(
        (l) => state =
            state.copyWith(isLoad: false, isError: true, errorMessage: l),
        (r) => state = state.copyWith(
            isLoad: false,
            isError: false,
            errorMessage: '',
            basketballLiveScore: r));
  }
}
