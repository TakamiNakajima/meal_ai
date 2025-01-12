import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_ai/domain/generate_menu/generate_menu_state.dart';
import 'package:meal_ai/presentation/page/generate_menu_page.dart';

final generateMenuProvider = StateNotifierProvider<GenerateMenuNotifier, GenerateMenuState>(
      (ref) => GenerateMenuNotifier(),
);

class GenerateMenuNotifier extends StateNotifier<GenerateMenuState> {
  GenerateMenuNotifier() : super(const GenerateMenuState()) {
    init();
  }

  /// 初期処理
  Future<void> init() async {}

  void onSelectDate(DateTime? start, DateTime? end) {
    if (state.pageState == PageState.start) {
      state = state.copyWith(pageState: PageState.end, rangeStartDay: start);
    } else if (state.pageState == PageState.end) {
      state = state.copyWith(pageState: PageState.generate, rangeEndDay: end);
    }
  }

  void startLoading() {
    state = state.copyWith(isLoading: true);
  }

  void stopLoading() {
    state = state.copyWith(isLoading: false);
  }
}