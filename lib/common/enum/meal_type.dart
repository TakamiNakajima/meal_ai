import 'package:json_annotation/json_annotation.dart';

@JsonEnum()
enum MealType {
  /// 主菜
  @JsonValue("主菜") mainDish,

  /// 副菜
  @JsonValue("副菜") sideDish,

  /// 主食
  @JsonValue("主食") stapleFood,

  /// 汁物
  @JsonValue("汁物") soup;
}
