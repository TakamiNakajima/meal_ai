// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_detail_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RecipeDetailStateImpl _$$RecipeDetailStateImplFromJson(
        Map<String, dynamic> json) =>
    _$RecipeDetailStateImpl(
      isLoading: json['isLoading'] as bool? ?? false,
      recipe: json['recipe'] == null
          ? null
          : Recipe.fromJson(json['recipe'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$RecipeDetailStateImplToJson(
        _$RecipeDetailStateImpl instance) =>
    <String, dynamic>{
      'isLoading': instance.isLoading,
      'recipe': instance.recipe,
    };
