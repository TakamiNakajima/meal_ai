import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:meal_ai/presentation/sign_in/sign_in_notifier.dart';
import 'package:meal_ai/presentation/sign_in/sign_in_state.dart';

class SignInPage extends ConsumerStatefulWidget {
  const SignInPage({super.key});

  @override
  ConsumerState<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends ConsumerState<SignInPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    /// ログイン状態を監視する
    ref.listen<SignInState>(
      signInProvider,
          (previous, next) {
        if (next.isLoggedIn) {
          context.go('/home');
        }
      },
    );

    final signInPageProvider = ref.watch(signInProvider);
    final signInPageNotifier = ref.read(signInProvider.notifier);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              "ログイン",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            TextField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                labelText: "メールアドレス",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: "パスワード",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                signInPageNotifier.signIn(
                  email: _emailController.text,
                  password: _passwordController.text,
                );
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              child: signInPageProvider.isLoading
                  ? const CircularProgressIndicator(color: Colors.white)
                  : const Text("ログイン", style: TextStyle(fontSize: 18)),
            ),
          ],
        ),
      ),
    );
  }
}
