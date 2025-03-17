import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meal_ai/presentation/generate_menu/generate_page_type.dart';

part 'generate_menu_state.freezed.dart';
part 'generate_menu_state.g.dart';

///
/// 献立生成画面のState <br><br>
///
/// 献立生成開始日 [rangeStartDay] <br>
/// 献立生成終了日 [rangeEndDay] <br>
/// 献立生成画面の状態 [pageState] <br>
///
@freezed
class GenerateMenuState with _$GenerateMenuState {
  ///
  /// 献立生成画面のState <br><br>
  ///
  /// 献立生成開始日 [rangeStartDay] <br>
  /// 献立生成終了日 [rangeEndDay] <br>
  /// 献立生成画面の状態 [pageState] <br>
  ///
  const factory GenerateMenuState({
    @Default(false) bool isLoading,
    DateTime? rangeStartDay,
    DateTime? rangeEndDay,
    @Default(GeneratePageType.start) GeneratePageType pageState,
  }) = _GenerateMenuState;

  factory GenerateMenuState.fromJson(Map<String, dynamic> json) =>
      _$GenerateMenuStateFromJson(json);
}
