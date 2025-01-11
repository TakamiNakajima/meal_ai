import 'package:flutter/material.dart';
import 'package:meal_ai/presentation/style/color.dart';

class ShoppingPage extends StatefulWidget {
  const ShoppingPage({super.key});

  @override
  State<ShoppingPage> createState() => _ShoppingPageState();
}

class _ShoppingPageState extends State<ShoppingPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColor.bgWhite,
      body: Center(
        child: Text("買い物"),
      ),
    );
  }
}
