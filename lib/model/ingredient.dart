import 'package:meal_ai/util/enum/unit_type.dart';

/// 材料データ
class Ingredient {
  /// 材料名
  late final String name;

  /// 量
  late final int quantity;

  /// 単位
  late final UnitType unit;

  /// 売り場
  late final String saleArea;

  Ingredient({
    required this.name,
    required this.quantity,
    required this.unit,
    required this.saleArea,
  });

  static fromMap(Map<String, dynamic> map) {
    return Ingredient(
      name: map['name'] as String,
      quantity: map['quantity'] as int,
      unit: UnitType.toUnitType(map['unit'] as String),
      saleArea: map['saleArea'] as String,
    );
  }

  static Map<String, dynamic> toMap(Ingredient ingredient) {
    return {
      'name': ingredient.name,
      'quantity': ingredient.quantity,
      'unit': ingredient.unit.toLabel(),
      'saleArea': ingredient.saleArea,
    };
  }
}
