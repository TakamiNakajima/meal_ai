import 'package:flutter/material.dart';
import 'package:meal_ai/style/color.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColor.bgWhite,
      body: Center(
        child: Text("設定"),
      ),
    );
  }
}
