import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_ai/domain/home/home_page_notifier.dart';
import 'package:meal_ai/presentation/style/color.dart';
import 'package:meal_ai/common/util/transition_util.dart';
import 'package:meal_ai/presentation/page/add_recipe_page.dart';
import 'package:meal_ai/presentation/page/menu_creation_page.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final homePageProvider = ref.watch(homeProvider);
    final homePageNotifier = ref.read(homeProvider.notifier);

    return Scaffold(
      backgroundColor: AppColor.bgWhite,
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColor.mainColor,
        onPressed: () {
          HapticFeedback.lightImpact();
          Navigator.of(context).push(
            TransitionUtil.whiteOut(
              const AddRecipePage(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: GestureDetector(
              onTap: () async {
                HapticFeedback.lightImpact();
                Navigator.of(context).push(
                  TransitionUtil.whiteOut(
                    const MenuCreationPage(),
                  ),
                );
              },
              child: Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [AppColor.subColor, AppColor.mainColor],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      spreadRadius: 1,
                      blurRadius: 8,
                      offset: const Offset(0, 1),
                    ),
                  ],
                ),
                child: const Center(
                  child: Text(
                    "献立を\n作成する",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}