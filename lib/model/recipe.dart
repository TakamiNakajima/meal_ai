import 'package:meal_ai/model/ingredient.dart';
import 'package:meal_ai/util/enum/meal_type.dart';

/// 料理
class Recipe {
  /// ID
  late final String id;

  /// 料理名
  late final String title;

  /// 説明文
  late final String description;

  /// 画像
  late final String imageUrl;

  /// 調理時間
  late final int cookingTime;

  /// カロリー
  late final int calorie;

  /// 材料リスト
  late final List<Ingredient> ingredients;

  /// 料理タイプ(主菜,副菜,主食,汁物)
  late final MealType mealType;

  /// 調理方法
  late final List<String> steps;

  /// アレルギー類
  late final List<String> allergies;

  /// タグ
  late final List<String> tags;

  Recipe({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.cookingTime,
    required this.calorie,
    required this.ingredients,
    required this.mealType,
    required this.steps,
    required this.allergies,
    required this.tags,
  });

  /// MapからRecipeオブジェクトを生成
  factory Recipe.fromMap(Map<String, dynamic> map) {
    return Recipe(
      id: map['id'] as String,
      title: map['title'] as String,
      description: map['description'] as String,
      imageUrl: map['imageUrl'] as String,
      cookingTime: map['cookingTime'] as int,
      calorie: map['calorie'] as int,
      ingredients: (map['ingredients']).map((e) => Ingredient.fromMap(e)).toList(),
      mealType: MealType.values.firstWhere((e) => e.toString() == map['mealType']),
      steps: List<String>.from(map['steps'] as List),
      allergies: List<String>.from(map['allergies'] as List),
      tags: List<String>.from(map['tags'] as List),
    );
  }

  /// RecipeオブジェクトをMapに変換
  static Map<String, dynamic> toMap(Recipe recipe) {
    return {
      'id': recipe.id,
      'title': recipe.title,
      'description': recipe.description,
      'imageUrl': recipe.imageUrl,
      'cookingTime': recipe.cookingTime,
      'calorie': recipe.calorie,
      'ingredients': recipe.ingredients.map((e) => Ingredient.toMap(e)).toList(),
      'mealType': recipe.mealType.toLabel(),
      'steps': recipe.steps,
      'allergies': recipe.allergies,
      'tags': recipe.tags,
    };
  }
}
