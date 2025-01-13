import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_ai/domain/home/home_state.dart';
import 'package:meal_ai/infrastructure/repository/recipe_repository.dart';
import 'package:meal_ai/infrastructure/service/firestore_service.dart';

final homeProvider = StateNotifierProvider<HomeNotifier, HomeState>(
      (ref) => HomeNotifier(recipeRepository: RecipeRepository(fireStoreService: FireStoreService())),
);

class HomeNotifier extends StateNotifier<HomeState> {
  final RecipeRepository recipeRepository;
  HomeNotifier({required this.recipeRepository}) : super(const HomeState()) {
    init();
  }

  /// 初期処理
  Future<void> init() async {}

  void startLoading() {
    state = state.copyWith(isLoading: true);
  }

  void stopLoading() {
    state = state.copyWith(isLoading: false);
  }
}