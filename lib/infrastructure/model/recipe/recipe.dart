import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:meal_ai/common/enum/meal_type.dart';
import 'package:meal_ai/infrastructure/model/ingredient/ingredient.dart';

part 'recipe.freezed.dart';
part 'recipe.g.dart';

@freezed
class Recipe with _$Recipe {
  const factory Recipe({
    /// ID
    required String id,

    /// 料理名
    required String title,

    /// 説明文
    required String description,

    /// 画像
    required String imageUrl,

    /// 調理時間
    required int cookingTime,

    /// カロリー
    required int calorie,

    /// 材料リスト
    required List<Ingredient> ingredients,

    /// 料理タイプ(主菜,副菜,主食,汁物)
    required MealType mealType,

    /// 調理方法
    required List<String> steps,

    /// アレルギー類
    required List<String> allergies,

    /// 検索タグ
    required List<String> tags,
  }) = _Recipe;

  factory Recipe.fromJson(Map<String, dynamic> json) => _$RecipeFromJson(json);
}
