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

  /// Enumの文字列ラベルを`UnitType`に変換
  static UnitType toUnitType(String label) {
    switch (label) {
      case "個":
        return UnitType.individual;
      case "本":
        return UnitType.stalk;
      case "玉":
        return UnitType.bulb;
      case "束":
        return UnitType.bunch;
      case "枚":
        return UnitType.sheet;
      case "房":
        return UnitType.cluster;
      case "g":
        return UnitType.gram;
      case "kg":
        return UnitType.kilogram;
      case "カップ":
        return UnitType.cup;
      case "大さじ":
        return UnitType.tablespoon;
      case "小さじ":
        return UnitType.teaspoon;
      case "mL":
        return UnitType.milliliter;
      case "L":
        return UnitType.liter;
      case "片":
        return UnitType.piece;
      case "少々":
        return UnitType.pinch;
      case "袋":
        return UnitType.pack;
      case "適量":
        return UnitType.toTaste;
      default:
        throw ArgumentError("Unsupported UnitType label: $label");
    }
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
