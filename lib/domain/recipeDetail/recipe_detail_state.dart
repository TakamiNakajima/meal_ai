import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meal_ai/infrastructure/model/recipe/recipe.dart';

part 'recipe_detail_state.freezed.dart';
part 'recipe_detail_state.g.dart';

@freezed
class RecipeDetailState with _$RecipeDetailState {
  const factory RecipeDetailState({
    @Default(false) bool isLoading,
    @Default(null) Recipe? recipe,
  }) = _RecipeDetailState;

  factory RecipeDetailState.fromJson(Map<String, dynamic> json) =>
      _$RecipeDetailStateFromJson(json);
}
