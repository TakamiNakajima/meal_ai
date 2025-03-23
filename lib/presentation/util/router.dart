import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meal_ai/presentation/sign_in/sign_in_page.dart';
import 'package:meal_ai/presentation/splash/splash_page.dart';
import 'package:meal_ai/presentation/util/transition_util.dart';
import 'package:meal_ai/main.dart';
import 'package:meal_ai/presentation/generate_menu/generate_menu_page.dart';
import 'package:meal_ai/presentation/recipe_detail/recipe_detail_page.dart';

final goRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: 'splash',
      pageBuilder: (context, state) {
        return MaterialPage(
          key: state.pageKey,
          child: const SplashPage(),
        );
      },
    ),
    GoRoute(
      path: '/signIn',
      pageBuilder: (context, state) {
        return MaterialPage(
          key: state.pageKey,
          child: const SignInPage(),
        );
      },
    ),
    GoRoute(
      path: '/home',
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