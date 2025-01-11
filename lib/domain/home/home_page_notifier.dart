import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_ai/domain/home/home_page_state.dart';
import 'package:meal_ai/infrastracture/repository/recipe_repository.dart';

final homeProvider = StateNotifierProvider<HomeNotifier, HomeState>(
      (ref) => HomeNotifier(recipeRepository: RecipeRepository()),
);

class HomeNotifier extends StateNotifier<HomeState> {
  final RecipeRepository recipeRepository;
  HomeNotifier({required this.recipeRepository}) : super(HomeState()) {
    init();
  }

  /// 初期処理
  Future<void> init() async {
    print("homepage init");
    // try {
    //   startLoading();
    //
    //   // RecipeRepositoryからデータを取得
    //   final recipes = await recipeRepository.fetchRecipes();
    //
    //   // データを状態に設定
    //   state = state.copyWith(data: recipes);
    // } catch (e) {
    //   // エラーハンドリング
    //   print('初期化処理中にエラー: $e');
    // } finally {
    //   stopLoading();
    // }
  }

  void startLoading() {
    state = state.copyWith(isLoading: true);
  }

  void stopLoading() {
    state = state.copyWith(isLoading: false);
  }
}