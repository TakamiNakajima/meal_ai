enum SaleArea {
  /// 野菜売り場
  vegetable,

  /// 調味料売り場
  seasoning,

  /// 魚売り場
  fish,

  /// 肉売り場
  meat,

  /// 乳製品売り場
  milk,

  /// パン売り場
  bread,

  /// その他
  other;

  static SaleArea toSaleArea(String unitString) {
    return SaleArea.values.firstWhere(
      (unit) => unit.toString().split('.').last == unitString,
    );
  }

  /// Enumの文字列ラベル
  String toLabel() {
    switch (this) {
      case SaleArea.vegetable:
        return "野菜";
      case SaleArea.seasoning:
        return "調味料";
      case SaleArea.fish:
        return "魚";
      case SaleArea.meat:
        return "肉";
      case SaleArea.milk:
        return "乳製品";
      case SaleArea.bread:
        return "パン";
      case SaleArea.other:
        return "その他";
    }
  }
}
