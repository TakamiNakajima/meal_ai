import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_ai/infrastructure/service/firebase_auth_service.dart';
import 'package:meal_ai/infrastructure/service/firestore_service.dart';
import 'package:meal_ai/infrastructure/service/shared_preferences_service.dart';

final authRepository = Provider(
  (ref) => AuthRepository(
    sharedPreferencesService: SharedPreferencesService(),
    firebaseAuthService: FirebaseAuthService(),
    fireStoreService: FireStoreService(),
  ),
);

class AuthRepository {
  static AuthRepository? _instance;
  final SharedPreferencesService _sharedPreferencesService;
  final FirebaseAuthService _firebaseAuthService;
  final FireStoreService _fireStoreService;

  User? currentUser;

  AuthRepository._internal({
    required SharedPreferencesService sharedPreferencesService,
    required FirebaseAuthService firebaseAuthService,
    required FireStoreService fireStoreService,
  })  : _sharedPreferencesService = sharedPreferencesService,
        _firebaseAuthService = firebaseAuthService,
        _fireStoreService = fireStoreService;

  factory AuthRepository({
    required SharedPreferencesService sharedPreferencesService,
    required FirebaseAuthService firebaseAuthService,
    required FireStoreService fireStoreService,
  }) {
    return _instance ??= AuthRepository._internal(
      sharedPreferencesService: sharedPreferencesService,
      firebaseAuthService: firebaseAuthService,
      fireStoreService: fireStoreService,
    );
  }

  /// SharedPreferenceからログイン情報を取得する
  Future<List<String>?> getStringList(String key) async {
    return await _sharedPreferencesService.getStringList(key);
  }

  /// ログイン処理
  Future<bool> signIn(String email, String password) async {
    try {
      currentUser = await _firebaseAuthService.signIn(email, password);
      if (currentUser != null && currentUser!.uid.isNotEmpty) {
        await _fireStoreService.setLastUpdatedAt(userId: currentUser!.uid, collection: 'users', key: 'lastLoginAt');
        await _sharedPreferencesService.setLogin(email, password);
        return true;
      }
    } catch (e) {
      print(e);
    }
    return false;
  }

  /// 新規登録処理
  Future<void> signUp(String email, String password) async {
    try {
      currentUser = await _firebaseAuthService.signUp(email, password);
      if (currentUser != null && currentUser!.uid.isNotEmpty) {
        await _fireStoreService.setLastUpdatedAt(userId: currentUser!.uid, collection: 'users', key: 'lastLoginAt');
        await _sharedPreferencesService.setLogin(email, password);
      }
    } catch (e) {
      print(e);
    }
  }
}
