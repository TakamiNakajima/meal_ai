// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu_list_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MenuListStateImpl _$$MenuListStateImplFromJson(Map<String, dynamic> json) =>
    _$MenuListStateImpl(
      recipeList: (json['recipeList'] as List<dynamic>?)
              ?.map((e) => Recipe.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      isLoading: json['isLoading'] as bool? ?? false,
    );

Map<String, dynamic> _$$MenuListStateImplToJson(_$MenuListStateImpl instance) =>
    <String, dynamic>{
      'recipeList': instance.recipeList,
      'isLoading': instance.isLoading,
    };
