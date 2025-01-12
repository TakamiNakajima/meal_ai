import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meal_ai/presentation/page/generate_menu_page.dart';

part 'generate_menu_state.freezed.dart';
part 'generate_menu_state.g.dart';

@freezed
class GenerateMenuState with _$GenerateMenuState {
  const factory GenerateMenuState({
    @Default(false) bool isLoading,
    DateTime? rangeStartDay,
    DateTime? rangeEndDay,
    @Default(PageState.start) PageState pageState,
  }) = _GenerateMenuState;

  factory GenerateMenuState.fromJson(Map<String, dynamic> json) =>
      _$GenerateMenuStateFromJson(json);
}
