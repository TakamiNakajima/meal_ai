import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:meal_ai/common/enum/unit_type.dart';
import 'package:meal_ai/presentation/recipe_detail/recipe_detail_notifier.dart';
import 'package:meal_ai/presentation/style/color.dart';
import 'package:meal_ai/presentation/util/screen_util.dart';

class RecipeDetailPage extends ConsumerStatefulWidget {
  final String recipeID;

  const RecipeDetailPage({super.key, required this.recipeID});

  @override
  ConsumerState<RecipeDetailPage> createState() => _RecipeDetailPageState();
}

class _RecipeDetailPageState extends ConsumerState<RecipeDetailPage> {
  @override
  Widget build(BuildContext context) {
    final detailPageProvider = ref.watch(recipeDetailProvider(widget.recipeID));

    if (detailPageProvider.isLoading && detailPageProvider.recipe == null) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return Scaffold(
        backgroundColor: AppColor.darkGray,
        body: Center(
          child: Container(
            width: ScreenUtil.width * 0.9,
            height: ScreenUtil.height * 0.9,
            decoration: BoxDecoration(
              color: AppColor.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: SingleChildScrollView(
              child: Stack(
                children: [
                  Column(
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(8),
                          topRight: Radius.circular(8),
                        ),
                        child: Image.network(
                          width: double.infinity,
                          height: 220,
                          fit: BoxFit.cover,
                          detailPageProvider.recipe!.imageUrl,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Row(
                                  children: [
                                    const Icon(Icons.timer_outlined, size: 16),
                                    Text("調理時間 ${detailPageProvider.recipe!.cookingTime.toString()}分")
                                  ],
                                ),
                                const SizedBox(width: 12),
                                Row(
                                  children: [
                                    const Icon(Icons.ac_unit, size: 16),
                                    Text("${detailPageProvider.recipe!.calorie.toString()}kcal")
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),
                            Text(
                              detailPageProvider.recipe!.title,
                              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(height: 16),
                            const Text(
                              "材料",
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                            ),
                            ListView.builder(
                              shrinkWrap: true, // 中身のサイズに合わせてリストの高さを調整
                              physics: const NeverScrollableScrollPhysics(), // スクロールを無効にする
                              itemCount: detailPageProvider.recipe!.ingredients.length,
                              itemBuilder: (context, index) {
                                final ingredient = detailPageProvider.recipe!.ingredients[index];
                                return Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(ingredient.name),
                                          Row(
                                            children: [
                                              Text(ingredient.quantity.toString()),
                                              Text(UnitType.toLabel(ingredient.unit)),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    const Divider(height: 10, thickness: 0.3, color: AppColor.darkGray),
                                  ],
                                );
                              },
                            ),
                            const Text(
                              "つくり方",
                              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                            ),
                            ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: detailPageProvider.recipe!.steps.length,
                              itemBuilder: (context, index) {
                                final stepCount = index + 1;
                                final step = detailPageProvider.recipe!.steps[index];
                                return Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                                      child: Row(
                                        children: [
                                          Stack(
                                            alignment: Alignment.center,
                                            children: [
                                              ClipOval(
                                                child: Container(width: 24, height: 24, color: Colors.grey),
                                              ),
                                              Text(
                                                stepCount.toString(),
                                                style: const TextStyle(color: AppColor.white),
                                              )
                                            ],
                                          ),
                                          const SizedBox(width: 12),
                                          ConstrainedBox(
                                            constraints: const BoxConstraints(maxWidth: 280),
                                            child: Text(
                                              step,
                                              textAlign: TextAlign.start,
                                              softWrap: true,
                                              overflow: TextOverflow.visible,
                                              style: const TextStyle(fontSize: 16),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const Divider(height: 10, thickness: 0.3, color: AppColor.darkGray),
                                  ],
                                );
                              },
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: () {
                      context.pop();
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(right: 4, top: 4),
                      child: Align(
                        alignment: Alignment.topRight,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            ClipOval(
                              child: Container(width: 40, height: 40, color: Colors.grey),
                            ),
                            const Icon(Icons.close, color: Colors.white, size: 24),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        )
    );
  }
}
