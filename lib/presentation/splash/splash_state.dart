import 'package:freezed_annotation/freezed_annotation.dart';

part 'splash_state.freezed.dart';
part 'splash_state.g.dart';

@freezed
class SplashState with _$SplashState {

  const factory SplashState({
    bool? isLoggedIn,
  }) = _SplashState;

  factory SplashState.fromJson(Map<String, dynamic> json) =>
      _$SplashStateFromJson(json);
}
