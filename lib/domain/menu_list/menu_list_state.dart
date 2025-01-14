import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meal_ai/infrastructure/model/recipe/recipe.dart';

part 'menu_list_state.freezed.dart';
part 'menu_list_state.g.dart';

///
/// 献立表画面のState <br><br>
///
/// 献立表リスト [recipeList] <br>
/// ローディングフラグ [isLoading] <br>
///
@freezed
class MenuListState with _$MenuListState {
  ///
  /// 献立表画面のState <br><br>
  ///
  /// 献立表リスト [recipeList] <br>
  /// ローディングフラグ [isLoading] <br>
  ///
  const factory MenuListState({
    @Default([]) List<Recipe> recipeList,
    @Default(false) bool isLoading,
  }) = _MenuListState;

  factory MenuListState.fromJson(Map<String, dynamic> json) =>
      _$MenuListStateFromJson(json);
}
