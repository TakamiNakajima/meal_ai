import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_ai/model/recipe.dart';
import 'package:meal_ai/repository/recipe_repository.dart';
import 'package:meal_ai/style/color.dart';
import 'package:meal_ai/util/transition_util.dart';
import 'package:meal_ai/view/recipe_detail.dart';

/// ノートリストを取得
final noteListProvider = FutureProvider.autoDispose<List<Recipe>>((ref) {
  return RecipeRepository.fetchRecipes();
});

class MenuPage extends ConsumerStatefulWidget {
  const MenuPage({super.key});

  @override
  ConsumerState<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends ConsumerState<MenuPage> {
  @override
  Widget build(BuildContext context) {
    final noteProvider = ref.watch(noteListProvider);

    return Scaffold(
      backgroundColor: AppColor.bgWhite,
      body: noteProvider.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('Error: $error')),
        data: (recipeList) {
          return Padding(
            padding: const EdgeInsets.only(top: 40),
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: recipeList.length,
              itemBuilder: (context, index) {
                final recipe = recipeList[index];
                return _recipeCard(recipe: recipe);
              },
            ),
          );
        },
      ),
    );
  }

  Widget _recipeCard({required Recipe recipe}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      child: InkWell(
        onTap: () {
          HapticFeedback.lightImpact();
          Navigator.of(context).push(
            TransitionUtil.whiteOut(
              RecipeDetailPage(recipe: recipe),
            ),
          );
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10), // 角丸の半径を指定
          child: Image.network(
            recipe.imageUrl,
            width: 120,
            height: 160,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
