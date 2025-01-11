import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:meal_ai/common/enum/sale_area.dart';
import 'package:meal_ai/common/enum/unit_type.dart';

part 'ingredient.freezed.dart';
part 'ingredient.g.dart';

@freezed
class Ingredient with _$Ingredient {
  const factory Ingredient({
    required String name,
    required String quantity,
    required UnitType unit,
    required SaleArea saleArea,
  }) = _Ingredient;

  factory Ingredient.fromJson(Map<String, dynamic> json) =>
      _$IngredientFromJson(json);
}