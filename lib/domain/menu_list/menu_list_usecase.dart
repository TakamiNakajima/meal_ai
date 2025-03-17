import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_ai/infrastructure/model/recipe/recipe.dart';
import 'package:meal_ai/infrastructure/repository/recipe_repository.dart';

final menuListUseCase =
    Provider.autoDispose((ref) => MenuListUseCase(recipeRepository: ref.read(recipeRepository)));

class MenuListUseCase {
  MenuListUseCase({
    required RecipeRepository recipeRepository,
  }) : _recipeRepository = recipeRepository;

  final RecipeRepository _recipeRepository;

  /// 初期処理
  Future<List<Recipe>> fetchRecipeList() async {
    return await _recipeRepository.fetchRecipeList();
  }
}
