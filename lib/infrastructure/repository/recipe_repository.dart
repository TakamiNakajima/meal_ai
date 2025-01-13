import 'package:meal_ai/infrastructure/model/recipe/recipe.dart';
import 'package:meal_ai/infrastructure/service/firestore_service.dart';

class RecipeRepository {
  final FireStoreService fireStoreService;
  RecipeRepository({required this.fireStoreService});

  Future<void> addRecipe(Recipe recipe) async {
    try {
      final Map<String, dynamic> mapData = {
        "id": recipe.id,
        "title": recipe.title,
        "description": recipe.description,
        "imageUrl": recipe.imageUrl,
        "cookingTime": recipe.cookingTime,
        "calorie": recipe.calorie,
        "ingredients": recipe.ingredients,
        "mealType": recipe.mealType,
        "steps": recipe.steps,
        "allergies": recipe.allergies,
        "tags": recipe.tags,
      };
      await fireStoreService.addData(
        collection: 'recipes',
        documentId: recipe.id,
        data: mapData,
      );
    } catch (e) {
      print('Failed to add recipe: $e');
      rethrow;
    }
  }

  Future<Recipe> fetchRecipe(String recipeID) async {
    try {
      final recipe = await fireStoreService.fetchRecipe(recipeID);
      return recipe;
    } catch (e) {
      print('Failed to fetch recipes: $e');
      rethrow;
    }
  }

  Future<List<Recipe>> fetchRecipeList() async {
    try {
      final recipes = await fireStoreService.fetchRecipeList();
      return recipes;
    } catch (e) {
      print('Failed to fetch recipes: $e');
      rethrow;
    }
  }
}
