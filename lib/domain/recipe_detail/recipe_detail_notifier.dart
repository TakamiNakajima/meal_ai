import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_ai/domain/recipe_detail/recipe_detail_state.dart';
import 'package:meal_ai/infrastructure/repository/recipe_repository.dart';
import 'package:meal_ai/infrastructure/service/firestore_service.dart';

final recipeDetailProvider = StateNotifierProvider.family<RecipeDetailNotifier, RecipeDetailState, String>(
  (ref, recipeID) => RecipeDetailNotifier(
    recipeRepository: RecipeRepository(
        fireStoreService: FireStoreService(
      fireStore: FirebaseFirestore.instance,
    )),
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
