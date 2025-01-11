import 'package:meal_ai/infrastructure/model/recipe.dart';

class MenuListState {
  final List<Recipe> recipeList;
  final bool isLoading;

  MenuListState({
    this.recipeList = const [],
    this.isLoading = false,
  });

  MenuListState copyWith({
    List<Recipe>? recipeList,
    bool? isLoading,
  }) {
    return MenuListState(
      recipeList: recipeList ?? this.recipeList,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
