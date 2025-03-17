import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_state.freezed.dart';
part 'home_state.g.dart';

///
/// ホーム画面のState <br><br>
///
/// ローディングフラグ [isLoading] <br>
///
@freezed
class HomeState with _$HomeState {
  ///
  /// ホーム画面のState <br><br>
  ///
  /// ローディングフラグ [isLoading] <br>
  ///
  const factory HomeState({
    @Default(false) bool isLoading,
  }) = _HomeState;

  factory HomeState.fromJson(Map<String, dynamic> json) =>
      _$HomeStateFromJson(json);
}
