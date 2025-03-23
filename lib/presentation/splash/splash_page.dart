import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:meal_ai/presentation/splash/splash_notifier.dart';
import 'package:meal_ai/presentation/splash/splash_state.dart';

class SplashPage extends ConsumerStatefulWidget {
  const SplashPage({super.key});

  @override
  ConsumerState<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends ConsumerState<SplashPage> {
  @override
  Widget build(BuildContext context) {

    /// 初期処理のログイン状態判定によって遷移先を変える
    ref.listen<SplashState>(
      splashProvider,
      (previous, next) {
        if (next.isLoggedIn == null) return;
        if (next.isLoggedIn!) {
          context.replace('/home');
        } else {
          context.replace('/signIn');
        }
      },
    );

    return const Scaffold(
        body: Center(
      child: Text("Splash"),
    ));
  }
}
