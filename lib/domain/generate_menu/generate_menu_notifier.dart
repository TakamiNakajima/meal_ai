import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_ai/common/enum/generate_page_state.dart';
import 'package:meal_ai/domain/generate_menu/generate_menu_state.dart';

final generateMenuProvider = StateNotifierProvider<GenerateMenuNotifier, GenerateMenuState>(
      (ref) => GenerateMenuNotifier(),
);

///
/// 献立生成画面のNotifier
///
class GenerateMenuNotifier extends StateNotifier<GenerateMenuState> {
  GenerateMenuNotifier() : super(const GenerateMenuState()) {
    init();
  }

  /// 初期処理
  Future<void> init() async {}

  void onSelectDate(DateTime? start, DateTime? end) {
    if (state.pageState == GeneratePageState.start) {
      state = state.copyWith(pageState: GeneratePageState.end, rangeStartDay: start);
    } else if (state.pageState == GeneratePageState.end) {
      state = state.copyWith(pageState: GeneratePageState.generate, rangeEndDay: end);
    }
  }

  void startLoading() {
    state = state.copyWith(isLoading: true);
  }

  void stopLoading() {
    state = state.copyWith(isLoading: false);
  }
}