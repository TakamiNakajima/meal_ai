import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_ai/domain/menuList/menu_state.dart';
import 'package:meal_ai/infrastructure/repository/recipe_repository.dart';

final menuListProvider = StateNotifierProvider<MenuListNotifier, MenuListState>(
  (ref) => MenuListNotifier(recipeRepository: RecipeRepository()),
);

class MenuListNotifier extends StateNotifier<MenuListState> {
  final RecipeRepository recipeRepository;

  MenuListNotifier({required this.recipeRepository}) : super(MenuListState()) {
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
