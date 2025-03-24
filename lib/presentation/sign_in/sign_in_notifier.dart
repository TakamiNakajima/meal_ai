import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_ai/infrastructure/repository/auth_repository.dart';
import 'package:meal_ai/presentation/sign_in/sign_in_state.dart';

final signInProvider = StateNotifierProvider.autoDispose<SignInNotifier, SignInState>(
  (ref) => SignInNotifier(
    authRepository: ref.read(authRepository),
  ),
);

///
/// SignIn画面のNotifier
///
class SignInNotifier extends StateNotifier<SignInState> {
  SignInNotifier({
    required AuthRepository authRepository,
  })  : _authRepository = authRepository,
        super(const SignInState());

  final AuthRepository _authRepository;

  /// ログイン処理
  Future<bool> signIn({
    required String email,
    required String password,
  }) async {
    state = state.copyWith(isLoading: true);

    final successFlg = await _authRepository.signIn(email, password);

    state = state.copyWith(isLoading: false);

    return successFlg;
  }
}
