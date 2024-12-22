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

  /// 文字列ラベルをSaleAreaに変換
  static SaleArea toSaleArea(String label) {
    switch (label) {
      case "野菜":
        return SaleArea.vegetable;
      case "調味料":
        return SaleArea.seasoning;
      case "魚":
        return SaleArea.fish;
      case "肉":
        return SaleArea.meat;
      case "乳製品":
        return SaleArea.milk;
      case "パン":
        return SaleArea.bread;
      case "その他":
        return SaleArea.other;
      default:
        throw ArgumentError("Unsupported SaleArea label: $label");
    }
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
