import 'package:json_annotation/json_annotation.dart';

@JsonEnum()
enum SaleArea {
  /// 野菜売り場
  @JsonValue("野菜") vegetable,

  /// 調味料売り場
  @JsonValue("調味料") seasoning,

  /// 魚売り場
  @JsonValue("魚") fish,

  /// 肉売り場
  @JsonValue("肉") meat,

  /// 乳製品売り場
  @JsonValue("乳製品") milk,

  /// パン売り場
  @JsonValue("パン") bread,

  /// その他
  @JsonValue("その他") other;
}