enum UnitType {
  /// 個
  individual,

  /// 本
  stalk,

  /// 玉
  bulb,

  /// 束
  bunch,

  /// 枚
  sheet,

  /// 房
  cluster,

  /// グラム
  gram,

  /// キログラム
  kilogram,

  /// カップ
  cup,

  /// 大さじ
  tablespoon,

  /// 小さじ
  teaspoon,

  /// ミリリットル
  milliliter,

  /// リットル
  liter,

  /// 片
  piece,

  /// 少々
  pinch,

  /// 袋
  pack,

  /// 適量
  toTaste;

  static UnitType toUnitType(String unitString) {
    return UnitType.values.firstWhere(
      (unit) => unit.toString().split('.').last == unitString,
    );
  }

  /// Enumの文字列ラベル
  String toLabel() {
    switch (this) {
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
        return "グラム";
      case UnitType.kilogram:
        return "キログラム";
      case UnitType.cup:
        return "カップ";
      case UnitType.tablespoon:
        return "大さじ";
      case UnitType.teaspoon:
        return "小さじ";
      case UnitType.milliliter:
        return "ミリリットル";
      case UnitType.liter:
        return "リットル";
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
