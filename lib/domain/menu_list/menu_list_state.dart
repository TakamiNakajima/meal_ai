import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meal_ai/infrastructure/model/recipe/recipe.dart';

part 'menu_list_state.freezed.dart';
part 'menu_list_state.g.dart';

@freezed
class MenuListState with _$MenuListState {
  const factory MenuListState({
    @Default([]) List<Recipe> recipeList,
    @Default(false) bool isLoading,
  }) = _MenuListState;

  factory MenuListState.fromJson(Map<String, dynamic> json) =>
      _$MenuListStateFromJson(json);
}
