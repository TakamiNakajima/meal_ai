enum MealType {
  /// 主菜
  mainDish,

  /// 副菜
  sideDish,

  /// 主食
  stapleFood,

  /// 汁物
  soup;

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
        return "汁";
    }
  }
}
