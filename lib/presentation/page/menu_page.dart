import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_ai/infrastracture/model/recipe.dart';
import 'package:meal_ai/infrastracture/repository/recipe_repository.dart';
import 'package:meal_ai/presentation/style/color.dart';
import 'package:meal_ai/common/util/transition_util.dart';
import 'package:meal_ai/presentation/page/recipe_detail_page.dart';

/// ノートリストを取得
final recipeListProvider = FutureProvider.autoDispose<List<Recipe>>((ref) {
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
    final recipesProvider = ref.watch(recipeListProvider);

    return Scaffold(
      backgroundColor: AppColor.bgWhite,
      body: recipesProvider.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('Error: $error')),
        data: (recipeList) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 1.0,
              ),
              itemCount: recipeList.length,
              itemBuilder: (context, index) {
                final recipe = recipeList[index];
                return InkWell(
                  onTap: () {
                    HapticFeedback.lightImpact();
                    Navigator.of(context).push(
                      TransitionUtil.whiteOut(
                        RecipeDetailPage(recipe: recipe),
                      ),
                    );
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      recipe.imageUrl,
                      width: 120,
                      height: 120,
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
