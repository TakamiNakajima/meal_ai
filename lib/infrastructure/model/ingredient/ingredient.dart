import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meal_ai/common/enum/sale_area.dart';
import 'package:meal_ai/common/enum/unit_type.dart';

part 'ingredient.freezed.dart';
part 'ingredient.g.dart';

@freezed
class Ingredient with _$Ingredient {
  const factory Ingredient({
    /// 材料名
    required String name,

    /// 量
    required int quantity,

    /// 単位
    required UnitType unit,

    /// 売り場
    required SaleArea saleArea,
  }) = _Ingredient;

  factory Ingredient.fromJson(Map<String, dynamic> json) => _$IngredientFromJson(json);
}
