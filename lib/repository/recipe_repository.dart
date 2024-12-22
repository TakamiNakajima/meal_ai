import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meal_ai/model/recipe.dart';
import 'package:meal_ai/service/firestore_service.dart';

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

  static Future<List<Recipe>> fetchRecipes() async {
    final querySnapshot = await FirebaseFirestore.instance.collection('recipes').get();

    final recipeList = querySnapshot.docs.map((doc) {
      return Recipe.fromMap(doc.data());
    }).toList();

    return recipeList;
  }
}
