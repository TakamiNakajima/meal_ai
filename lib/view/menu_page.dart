import 'package:flutter/material.dart';

import '../style/color.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColor.bgWhite,
      body: Center(
        child: Text("献立"),
      ),
    );
  }
}
