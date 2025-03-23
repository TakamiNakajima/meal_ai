// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generate_menu_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GenerateMenuStateImpl _$$GenerateMenuStateImplFromJson(
        Map<String, dynamic> json) =>
    _$GenerateMenuStateImpl(
      isLoading: json['isLoading'] as bool? ?? false,
      rangeStartDay: json['rangeStartDay'] == null
          ? null
          : DateTime.parse(json['rangeStartDay'] as String),
      rangeEndDay: json['rangeEndDay'] == null
          ? null
          : DateTime.parse(json['rangeEndDay'] as String),
      pageState:
          $enumDecodeNullable(_$GeneratePageTypeEnumMap, json['pageState']) ??
              GeneratePageType.start,
    );

Map<String, dynamic> _$$GenerateMenuStateImplToJson(
        _$GenerateMenuStateImpl instance) =>
    <String, dynamic>{
      'isLoading': instance.isLoading,
      'rangeStartDay': instance.rangeStartDay?.toIso8601String(),
      'rangeEndDay': instance.rangeEndDay?.toIso8601String(),
      'pageState': _$GeneratePageTypeEnumMap[instance.pageState]!,
    };

const _$GeneratePageTypeEnumMap = {
  GeneratePageType.start: 'start',
  GeneratePageType.end: 'end',
  GeneratePageType.generate: 'generate',
};
