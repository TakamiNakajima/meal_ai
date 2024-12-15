
import 'package:meal_ai/model/recipe.dart';
import 'package:meal_ai/service/firestore_service.dart';

class RecipeRepository {
  /// `recipes`コレクションにデータを保存する関数
  static Future<void> addRecipe(Recipe recipe) async {
    try {
      await FireStoreService.addData(collection: 'recipes', data: Recipe.toMap(recipe));
    } catch (e) {
      print('Failed to add recipe: $e');
      rethrow;
    }
  }
}