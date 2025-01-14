import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meal_ai/presentation/util/transition_util.dart';
import 'package:meal_ai/main.dart';
import 'package:meal_ai/presentation/page/generate_menu_page.dart';
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
      path: '/generateMenuPage',
      pageBuilder: (context, state) {
        return const CustomTransitionPage(
          child: GenerateMenuPage(),
          transitionsBuilder: TransitionUtil.buildWhiteOutTransition,
          transitionDuration: Duration(seconds: 1),
          reverseTransitionDuration: Duration(seconds: 1),
        );
      },
    ),
    GoRoute(
      path: '/recipeDetailPage',
      pageBuilder: (BuildContext context, GoRouterState state) {
        final recipeID = state.uri.queryParameters['recipeID']!;
        return CustomTransitionPage(
          child: RecipeDetailPage(recipeID: recipeID),
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