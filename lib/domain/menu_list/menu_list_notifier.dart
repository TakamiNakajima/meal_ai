import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_ai/domain/menu_list/menu_list_state.dart';
import 'package:meal_ai/infrastructure/repository/recipe_repository.dart';
import 'package:meal_ai/infrastructure/service/firestore_service.dart';

final menuListProvider = StateNotifierProvider.autoDispose<MenuListNotifier, MenuListState>(
  (ref) => MenuListNotifier(
    recipeRepository: RecipeRepository(
        fireStoreService: FireStoreService(
      fireStore: FirebaseFirestore.instance,
    )),
  ),
);

///
/// 献立表画面のNotifier
///
class MenuListNotifier extends StateNotifier<MenuListState> {
  MenuListNotifier({
    required RecipeRepository recipeRepository,
  })  : _recipeRepository = recipeRepository,
        super(const MenuListState()) {
    init();
  }

  final RecipeRepository _recipeRepository;

  /// 初期処理
  Future<void> init() async {
    try {
      state = state.copyWith(
        isLoading: true,
      );

      final recipes = await _recipeRepository.fetchRecipeList();

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
