import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meal_ai/common/util/transition_util.dart';
import 'package:meal_ai/main.dart';
import 'package:meal_ai/presentation/page/add_recipe_page.dart';
import 'package:meal_ai/presentation/page/menu_creation_page.dart';
import 'package:meal_ai/presentation/page/recipe_detail_page.dart';

final goRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: 'initial',
      pageBuilder: (context, state) {
        return MaterialPage(
          key: state.pageKey,
          child: const MyHomePage(),
        );
      },
    ),
    GoRoute(
      path: '/menuCreationPage',
      pageBuilder: (context, state) {
        return const CustomTransitionPage(
          child: MenuCreationPage(),
          transitionsBuilder: TransitionUtil.buildWhiteOutTransition,
          transitionDuration: Duration(seconds: 1),
          reverseTransitionDuration: Duration(seconds: 1),
        );
      },
    ),
    GoRoute(
      path: '/addPage',
      pageBuilder: (context, state) {
        return const CustomTransitionPage(
          child: AddRecipePage(),
          transitionsBuilder: TransitionUtil.buildWhiteOutTransition,
          transitionDuration: Duration(seconds: 1),
          reverseTransitionDuration: Duration(seconds: 1),
        );
      },
    ),
    GoRoute(
      path: '/recipeDetailPage/:recipeId',
      pageBuilder: (context, state) {
        final recipeId = state.pathParameters['recipeId'];
        return CustomTransitionPage(
          child: RecipeDetailPage(recipeID: recipeId!),
          transitionsBuilder: TransitionUtil.buildWhiteOutTransition,
          transitionDuration: const Duration(seconds: 1),
          reverseTransitionDuration: const Duration(seconds: 1),
        );
      },
    ),
  ],
  errorPageBuilder: (context, state) => MaterialPage(
    key: state.pageKey,
    child: Scaffold(
      body: Center(
        child: Text(state.error.toString()),
      ),
    ),
  ),
);