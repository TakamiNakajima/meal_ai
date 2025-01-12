import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_ai/domain/recipe_detail/recipe_detail_state.dart';
import 'package:meal_ai/infrastructure/repository/recipe_repository.dart';

final recipeDetailProvider = StateNotifierProvider.family<RecipeDetailNotifier, RecipeDetailState, String>(
  (ref, recipeID) => RecipeDetailNotifier(
    recipeRepository: RecipeRepository(),
    recipeID: recipeID,
  ),
);

class RecipeDetailNotifier extends StateNotifier<RecipeDetailState> {
  final RecipeRepository recipeRepository;
  final String recipeID;

  RecipeDetailNotifier({
    required this.recipeRepository,
    required this.recipeID,
  }) : super(RecipeDetailState()) {
    init();
  }

  /// 初期処理
  Future<void> init() async {
    try {
      state = state.copyWith(
        isLoading: true,
      );

      final recipe = await recipeRepository.fetchRecipe(recipeID);

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
