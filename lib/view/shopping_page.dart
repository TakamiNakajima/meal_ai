import 'package:flutter/material.dart';

import '../style/color.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColor.bgWhite,
      body: Center(
        child: Text("カレンダー"),
      ),
    );
  }
}
