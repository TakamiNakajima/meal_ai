import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meal_ai/common/enum/generate_page_state.dart';

part 'generate_menu_state.freezed.dart';
part 'generate_menu_state.g.dart';

@freezed
class GenerateMenuState with _$GenerateMenuState {
  const factory GenerateMenuState({
    @Default(false) bool isLoading,
    DateTime? rangeStartDay,
    DateTime? rangeEndDay,
    @Default(GeneratePageState.start) GeneratePageState pageState,
  }) = _GenerateMenuState;

  factory GenerateMenuState.fromJson(Map<String, dynamic> json) =>
      _$GenerateMenuStateFromJson(json);
}
