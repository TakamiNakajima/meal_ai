import 'package:flutter/material.dart';
import 'package:meal_ai/model/recipe.dart';
import 'package:meal_ai/style/color.dart';
import 'package:meal_ai/util/screen_util.dart';

class RecipeDetailPage extends StatefulWidget {
  final Recipe recipe;

  const RecipeDetailPage({super.key, required this.recipe});

  @override
  State<RecipeDetailPage> createState() => _RecipeDetailPageState();
}

class _RecipeDetailPageState extends State<RecipeDetailPage> {
  @override
  Widget build(BuildContext context) {
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
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                  child: Image.network(
                    width: double.infinity,
                    height: 220,
                    fit: BoxFit.cover,
                    widget.recipe.imageUrl,
                  ),
                ),
                Text(widget.recipe.title)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
