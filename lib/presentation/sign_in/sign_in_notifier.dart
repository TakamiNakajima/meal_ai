import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_ai/infrastructure/repository/auth_repository.dart';
import 'package:meal_ai/infrastructure/service/firebase_auth_service.dart';
import 'package:meal_ai/infrastructure/service/firestore_service.dart';
import 'package:meal_ai/infrastructure/service/shared_preferences_service.dart';
import 'package:meal_ai/presentation/sign_in/sign_in_state.dart';

final signInProvider = StateNotifierProvider.autoDispose<SignInNotifier, SignInState>(
  (ref) => SignInNotifier(
      authRepository: AuthRepository(
    sharedPreferencesService: SharedPreferencesService(),
    fireStoreService: FireStoreService(),
    firebaseAuthService: FirebaseAuthService(),
  )),
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
  Future<void> signIn({
    required String email,
    required String password,
  }) async {
    state = state.copyWith(
      isLoading: true,
    );

    final successFlg = await _authRepository.signIn(email, password);

    if (successFlg) {
      state = state.copyWith(
        isLoading: false,
        isLoggedIn: true,
      );
    } else {
      state = state.copyWith(
        isLoading: false,
      );
    }

  }
}
