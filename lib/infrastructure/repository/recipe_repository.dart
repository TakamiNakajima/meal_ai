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
