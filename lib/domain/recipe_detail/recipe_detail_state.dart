import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meal_ai/infrastructure/model/recipe/recipe.dart';

part 'recipe_detail_state.freezed.dart';
part 'recipe_detail_state.g.dart';

///
/// レシピ詳細画面のState <br><br>
///
/// ローディングフラグ [isLoading] <br>
/// レシピ [recipe] <br>
///
@freezed
class RecipeDetailState with _$RecipeDetailState {
  ///
  /// レシピ詳細画面のState <br><br>
  ///
  /// ローディングフラグ [isLoading] <br>
  /// レシピ [recipe] <br>
  ///
  const factory RecipeDetailState({
    @Default(false) bool isLoading,
    @Default(null) Recipe? recipe,
  }) = _RecipeDetailState;

  factory RecipeDetailState.fromJson(Map<String, dynamic> json) =>
      _$RecipeDetailStateFromJson(json);
}
