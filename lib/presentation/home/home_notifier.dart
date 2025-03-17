import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_ai/presentation/home/home_state.dart';

final homeProvider = StateNotifierProvider.autoDispose<HomeNotifier, HomeState>(
  (ref) => HomeNotifier(),
);

///
/// ホーム画面のNotifier
///
class HomeNotifier extends StateNotifier<HomeState> {
  HomeNotifier() : super(const HomeState()) {
    init();
  }

  /// 初期処理
  Future<void> init() async {}

  void startLoading() {
    state = state.copyWith(isLoading: true);
  }

  void stopLoading() {
    state = state.copyWith(isLoading: false);
  }
}
