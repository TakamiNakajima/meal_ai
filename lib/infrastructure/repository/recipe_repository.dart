import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_ai/infrastructure/model/recipe/recipe.dart';
import 'package:meal_ai/infrastructure/service/firestore_service.dart';

final recipeRepository = Provider(
      (ref) => RecipeRepository(fireStoreService: FireStoreService()),
);

class RecipeRepository {
  static RecipeRepository? _instance;

  final FireStoreService _fireStoreService;

  RecipeRepository._internal({required FireStoreService fireStoreService})
      : _fireStoreService = fireStoreService;

  factory RecipeRepository({required FireStoreService fireStoreService}) {
    return _instance ??= RecipeRepository._internal(fireStoreService: fireStoreService);
  }

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
      await _fireStoreService.addData(
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
      return await _fireStoreService.fetchRecipe(recipeID);
    } catch (e) {
      print('Failed to fetch recipe: $e');
      rethrow;
    }
  }

  Future<List<Recipe>> fetchRecipeList() async {
    try {
      return await _fireStoreService.fetchRecipeList();
    } catch (e) {
      print('Failed to fetch recipes: $e');
      rethrow;
    }
  }
}
