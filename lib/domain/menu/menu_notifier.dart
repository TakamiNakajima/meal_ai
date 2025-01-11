import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_ai/domain/menu/menu_state.dart';
import 'package:meal_ai/infrastructure/repository/recipe_repository.dart';

final menuProvider = StateNotifierProvider<MenuNotifier, MenuState>(
  (ref) => MenuNotifier(recipeRepository: RecipeRepository()),
);

class MenuNotifier extends StateNotifier<MenuState> {
  final RecipeRepository recipeRepository;

  MenuNotifier({required this.recipeRepository}) : super(MenuState()) {
    init();
  }

  /// 初期処理
  Future<void> init() async {
    try {
      state = state.copyWith(
        isLoading: true,
      );

      final recipes = await recipeRepository.fetchRecipeList();

      state = state.copyWith(
        isLoading: false,
        recipeList: recipes,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
      );
    }
  }
}
