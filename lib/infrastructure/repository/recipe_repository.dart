import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_ai/infrastructure/data_source/firestore_data_source.dart';
import 'package:meal_ai/infrastructure/model/recipe/recipe.dart';

final recipeRepository = Provider(
      (ref) => RecipeRepository(fireStoreDataSource: FireStoreDataSource()),
);

class RecipeRepository {
  static RecipeRepository? _instance;

  final FireStoreDataSource _fireStoreDataSource;

  RecipeRepository._internal({required FireStoreDataSource fireStoreDataSource})
      : _fireStoreDataSource = fireStoreDataSource;

  factory RecipeRepository({required FireStoreDataSource fireStoreDataSource}) {
    return _instance ??= RecipeRepository._internal(fireStoreDataSource: fireStoreDataSource);
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
      await _fireStoreDataSource.addData(
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
      return await _fireStoreDataSource.fetchRecipe(recipeID);
    } catch (e) {
      print('Failed to fetch recipe: $e');
      rethrow;
    }
  }

  Future<List<Recipe>> fetchRecipeList() async {
    try {
      return await _fireStoreDataSource.fetchRecipeList();
    } catch (e) {
      print('Failed to fetch recipes: $e');
      rethrow;
    }
  }
}
