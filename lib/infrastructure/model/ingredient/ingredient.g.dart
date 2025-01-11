// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ingredient.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$IngredientImpl _$$IngredientImplFromJson(Map<String, dynamic> json) =>
    _$IngredientImpl(
      name: json['name'] as String,
      quantity: json['quantity'] as String,
      unit: $enumDecode(_$UnitTypeEnumMap, json['unit']),
      saleArea: $enumDecode(_$SaleAreaEnumMap, json['saleArea']),
    );

Map<String, dynamic> _$$IngredientImplToJson(_$IngredientImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'quantity': instance.quantity,
      'unit': _$UnitTypeEnumMap[instance.unit]!,
      'saleArea': _$SaleAreaEnumMap[instance.saleArea]!,
    };

const _$UnitTypeEnumMap = {
  UnitType.individual: 'individual',
  UnitType.stalk: 'stalk',
  UnitType.bulb: 'bulb',
  UnitType.bunch: 'bunch',
  UnitType.sheet: 'sheet',
  UnitType.cluster: 'cluster',
  UnitType.gram: 'gram',
  UnitType.kilogram: 'kilogram',
  UnitType.cup: 'cup',
  UnitType.tablespoon: 'tablespoon',
  UnitType.teaspoon: 'teaspoon',
  UnitType.milliliter: 'milliliter',
  UnitType.liter: 'liter',
  UnitType.piece: 'piece',
  UnitType.pinch: 'pinch',
  UnitType.pack: 'pack',
  UnitType.toTaste: 'toTaste',
};

const _$SaleAreaEnumMap = {
  SaleArea.vegetable: 'vegetable',
  SaleArea.seasoning: 'seasoning',
  SaleArea.fish: 'fish',
  SaleArea.meat: 'meat',
  SaleArea.milk: 'milk',
  SaleArea.bread: 'bread',
  SaleArea.other: 'other',
};
