import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_ai/domain/menu_list/menu_list_state.dart';
import 'package:meal_ai/infrastructure/repository/recipe_repository.dart';
import 'package:meal_ai/infrastructure/service/firestore_service.dart';

final menuListProvider = StateNotifierProvider<MenuListNotifier, MenuListState>(
  (ref) => MenuListNotifier(recipeRepository: RecipeRepository(fireStoreService: FireStoreService())),
);

class MenuListNotifier extends StateNotifier<MenuListState> {
  final RecipeRepository recipeRepository;

  MenuListNotifier({required this.recipeRepository}) : super(const MenuListState()) {
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
