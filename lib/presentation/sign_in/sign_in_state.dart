import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_in_state.freezed.dart';
part 'sign_in_state.g.dart';

@freezed
class SignInState with _$SignInState {

  const factory SignInState({
    @Default(false) bool isLoading,
  }) = _SignInState;

  factory SignInState.fromJson(Map<String, dynamic> json) =>
      _$SignInStateFromJson(json);
}
