// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RecipeImpl _$$RecipeImplFromJson(Map<String, dynamic> json) => _$RecipeImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      imageUrl: json['imageUrl'] as String,
      cookingTime: (json['cookingTime'] as num).toInt(),
      calorie: (json['calorie'] as num).toInt(),
      ingredients: (json['ingredients'] as List<dynamic>)
          .map((e) => Ingredient.fromJson(e as Map<String, dynamic>))
          .toList(),
      mealType: $enumDecode(_$MealTypeEnumMap, json['mealType']),
      steps: (json['steps'] as List<dynamic>).map((e) => e as String).toList(),
      allergies:
          (json['allergies'] as List<dynamic>).map((e) => e as String).toList(),
      tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$RecipeImplToJson(_$RecipeImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'imageUrl': instance.imageUrl,
      'cookingTime': instance.cookingTime,
      'calorie': instance.calorie,
      'ingredients': instance.ingredients,
      'mealType': _$MealTypeEnumMap[instance.mealType]!,
      'steps': instance.steps,
      'allergies': instance.allergies,
      'tags': instance.tags,
    };

const _$MealTypeEnumMap = {
  MealType.mainDish: 'mainDish',
  MealType.sideDish: 'sideDish',
  MealType.stapleFood: 'stapleFood',
  MealType.soup: 'soup',
};
