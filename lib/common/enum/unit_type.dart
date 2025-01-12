import 'package:json_annotation/json_annotation.dart';

@JsonEnum()
enum UnitType {
  /// 個
  @JsonValue("個")
  individual,

  /// 本
  @JsonValue("本")
  stalk,

  /// 玉
  @JsonValue("玉")
  bulb,

  /// 束
  @JsonValue("束")
  bunch,

  /// 枚
  @JsonValue("枚")
  sheet,

  /// 房
  @JsonValue("房")
  cluster,

  /// グラム
  @JsonValue("g")
  gram,

  /// キログラム
  @JsonValue("kg")
  kilogram,

  /// カップ
  @JsonValue("カップ")
  cup,

  /// 大さじ
  @JsonValue("大さじ")
  tablespoon,

  /// 小さじ
  @JsonValue("小さじ")
  teaspoon,

  /// ミリリットル
  @JsonValue("mL")
  milliliter,

  /// リットル
  @JsonValue("L")
  liter,

  /// 片
  @JsonValue("片")
  piece,

  /// 少々
  @JsonValue("少々")
  pinch,

  /// 袋
  @JsonValue("袋")
  pack,

  /// 適量
  @JsonValue("適量")
  toTaste;

  static String toLabel(UnitType type) {
    switch (type) {
      case UnitType.individual:
        return "個";
      case UnitType.stalk:
        return "本";
      case UnitType.bulb:
        return "玉";
      case UnitType.bunch:
        return "束";
      case UnitType.sheet:
        return "枚";
      case UnitType.cluster:
        return "房";
      case UnitType.gram:
        return "g";
      case UnitType.kilogram:
        return "kg";
      case UnitType.cup:
        return "カップ";
      case UnitType.tablespoon:
        return "大さじ";
      case UnitType.teaspoon:
        return "小さじ";
      case UnitType.milliliter:
        return "mL";
      case UnitType.liter:
        return "L";
      case UnitType.piece:
        return "片";
      case UnitType.pinch:
        return "少々";
      case UnitType.pack:
        return "袋";
      case UnitType.toTaste:
        return "適量";
    }
  }
}
