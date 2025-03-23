import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_ai/infrastructure/repository/auth_repository.dart';
import 'package:meal_ai/infrastructure/service/firebase_auth_service.dart';
import 'package:meal_ai/infrastructure/service/firestore_service.dart';
import 'package:meal_ai/infrastructure/service/shared_preferences_service.dart';
import 'package:meal_ai/presentation/splash/splash_state.dart';

final splashProvider = StateNotifierProvider.autoDispose<SplashNotifier, SplashState>(
  (ref) => SplashNotifier(
      authRepository: AuthRepository(
    sharedPreferencesService: SharedPreferencesService(),
    fireStoreService: FireStoreService(),
    firebaseAuthService: FirebaseAuthService(),
  )),
);

///
/// Splash画面のNotifier
///
class SplashNotifier extends StateNotifier<SplashState> {
  SplashNotifier({
    required AuthRepository authRepository,
  })  : _authRepository = authRepository,
        super(const SplashState()) {
    init();
  }

  final AuthRepository _authRepository;

  /// 初期処理
  ///
  /// ローカルにログイン情報があるかどうか
  Future<void> init() async {
    final loginInfo = await _authRepository.getStringList("loginInfo");
    await Future.delayed(const Duration(seconds: 1));
    if (loginInfo == null) {
      state = state.copyWith(
        isLoggedIn: false,
      );
    } else {
      await _authRepository.signIn(loginInfo[0], loginInfo[1]);
      state = state.copyWith(
        isLoggedIn: true,
      );
    }
  }
}
