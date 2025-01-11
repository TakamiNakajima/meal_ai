import 'package:meal_ai/infrastructure/model/recipe.dart';

class MenuState {
  final List<Recipe> recipeList;
  final bool isLoading;

  MenuState({
    this.recipeList = const [],
    this.isLoading = false,
  });

  MenuState copyWith({
    List<Recipe>? recipeList,
    bool? isLoading,
  }) {
    return MenuState(
      recipeList: recipeList ?? this.recipeList,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
