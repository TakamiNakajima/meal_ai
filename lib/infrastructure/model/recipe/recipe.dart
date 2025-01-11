import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:meal_ai/common/enum/meal_type.dart';
import 'package:meal_ai/infrastructure/model/ingredient/ingredient.dart';

part 'recipe.freezed.dart';
part 'recipe.g.dart';

@freezed
class Recipe with _$Recipe {
  const factory Recipe({
    required String id,
    required String title,
    required String description,
    required String imageUrl,
    required int cookingTime,
    required int calorie,
    required List<Ingredient> ingredients,
    required MealType mealType,
    required List<String> steps,
    required List<String> allergies,
    required List<String> tags,
  }) = _Recipe;

  factory Recipe.fromJson(Map<String, dynamic> json) =>
      _$RecipeFromJson(json);
}