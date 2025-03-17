import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_ai/presentation/recipe_detail/recipe_detail_state.dart';
import 'package:meal_ai/infrastructure/data_source/firestore_data_source.dart';
import 'package:meal_ai/infrastructure/repository/recipe_repository.dart';

final recipeDetailProvider =
    StateNotifierProvider.autoDispose.family<RecipeDetailNotifier, RecipeDetailState, String>(
  (ref, recipeID) => RecipeDetailNotifier(
    recipeRepository: RecipeRepository(fireStoreDataSource: FireStoreDataSource()),
    recipeID: recipeID,
  ),
);

///
/// レシピ詳細画面のNotifier
///
class RecipeDetailNotifier extends StateNotifier<RecipeDetailState> {
  RecipeDetailNotifier({
    required RecipeRepository recipeRepository,
    required String recipeID,
  })  : _recipeID = recipeID,
        _recipeRepository = recipeRepository,
        super(const RecipeDetailState()) {
    init();
  }

  final RecipeRepository _recipeRepository;

  final String _recipeID;

  /// 初期処理
  Future<void> init() async {
    try {
      state = state.copyWith(
        isLoading: true,
      );

      final recipe = await _recipeRepository.fetchRecipe(_recipeID);

      state = state.copyWith(
        isLoading: false,
        recipe: recipe,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
      );
    }
  }
}
