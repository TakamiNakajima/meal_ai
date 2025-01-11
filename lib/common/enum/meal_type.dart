enum MealType {
  /// 主菜
  mainDish,

  /// 副菜
  sideDish,

  /// 主食
  stapleFood,

  /// 汁物
  soup;

  /// 文字列ラベルをMealTypeに変換
  static MealType toMealType(String label) {
    switch (label) {
      case "主菜":
        return MealType.mainDish;
      case "副菜":
        return MealType.sideDish;
      case "主食":
        return MealType.stapleFood;
      case "汁物":
        return MealType.soup;
      default:
        throw ArgumentError("Unsupported MealType label: $label");
    }
  }

  /// Enumの文字列ラベル
  String toLabel() {
    switch (this) {
      case MealType.mainDish:
        return "主菜";
      case MealType.sideDish:
        return "副菜";
      case MealType.stapleFood:
        return "主食";
      case MealType.soup:
        return "汁物";
    }
  }
}
