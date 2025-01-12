// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ingredient.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$IngredientImpl _$$IngredientImplFromJson(Map<String, dynamic> json) =>
    _$IngredientImpl(
      name: json['name'] as String,
      quantity: (json['quantity'] as num).toInt(),
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
  UnitType.individual: '個',
  UnitType.stalk: '本',
  UnitType.bulb: '玉',
  UnitType.bunch: '束',
  UnitType.sheet: '枚',
  UnitType.cluster: '房',
  UnitType.gram: 'g',
  UnitType.kilogram: 'kg',
  UnitType.cup: 'カップ',
  UnitType.tablespoon: '大さじ',
  UnitType.teaspoon: '小さじ',
  UnitType.milliliter: 'mL',
  UnitType.liter: 'L',
  UnitType.piece: '片',
  UnitType.pinch: '少々',
  UnitType.pack: '袋',
  UnitType.toTaste: '適量',
};

const _$SaleAreaEnumMap = {
  SaleArea.vegetable: '野菜',
  SaleArea.seasoning: '調味料',
  SaleArea.fish: '魚',
  SaleArea.meat: '肉',
  SaleArea.milk: '乳製品',
  SaleArea.bread: 'パン',
  SaleArea.other: 'その他',
};
