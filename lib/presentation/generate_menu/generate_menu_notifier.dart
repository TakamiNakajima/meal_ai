import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_ai/presentation/generate_menu/generate_page_type.dart';
import 'package:meal_ai/presentation/generate_menu/generate_menu_state.dart';

final generateMenuProvider = StateNotifierProvider.autoDispose<GenerateMenuNotifier, GenerateMenuState>(
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
    if (state.pageState == GeneratePageType.start) {
      state = state.copyWith(pageState: GeneratePageType.end, rangeStartDay: start);
    } else if (state.pageState == GeneratePageType.end) {
      state = state.copyWith(pageState: GeneratePageType.generate, rangeEndDay: end);
    }
  }

  void startLoading() {
    state = state.copyWith(isLoading: true);
  }

  void stopLoading() {
    state = state.copyWith(isLoading: false);
  }
}