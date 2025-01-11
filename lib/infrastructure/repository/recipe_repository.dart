import 'package:meal_ai/infrastructure/model/recipe.dart';
import 'package:meal_ai/infrastructure/service/firestore_service.dart';

class RecipeRepository {
  static Future<void> addRecipe(Recipe recipe) async {
    try {
      await FireStoreService.addData(
        collection: 'recipes',
        documentId: recipe.id,
        data: Recipe.toMap(recipe),
      );
    } catch (e) {
      print('Failed to add recipe: $e');
      rethrow;
    }
  }

  static Future<Recipe> fetchRecipe(String recipeID) async {
    try {
      final recipe = await FireStoreService.fetchRecipe(recipeID);
      return recipe;
    } catch (e) {
      print('Failed to fetch recipes: $e');
      rethrow;
    }
  }

  Future<List<Recipe>> fetchRecipeList() async {
    try {
      final recipes = await FireStoreService.fetchRecipeList();
      return recipes;
    } catch (e) {
      print('Failed to fetch recipes: $e');
      rethrow;
    }
  }
}
