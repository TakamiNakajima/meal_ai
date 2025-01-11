import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:meal_ai/firebase_options.dart';
import 'package:meal_ai/presentation/style/color.dart';
import 'package:meal_ai/common/util/screen_util.dart';
import 'package:meal_ai/presentation/page/shopping_page.dart';
import 'package:meal_ai/presentation/page/home_page.dart';
import 'package:meal_ai/presentation/page/menu_page.dart';
import 'package:meal_ai/presentation/page/setting_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  await initializeDateFormatting('ja_JP').then(
    (_) {
      runApp(const ProviderScope(child: MyApp()));
    },
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenUtil.initialize(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: false,
        primaryColor: AppColor.mainColor,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const HomePage(),
    const ShoppingPage(),
    const MenuPage(),
    const SettingPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
      bottomNavigationBar: Stack(
        alignment: Alignment.center,
        children: [
          BottomNavigationBar(
            elevation: 0,
            fixedColor: AppColor.mainColor,
            unselectedItemColor: AppColor.darkGray,
            backgroundColor: AppColor.bgWhite,
            type: BottomNavigationBarType.fixed,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home_rounded),
                label: 'ホーム',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart_rounded),
                label: '買い物',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.event_note_rounded),
                label: '献立表',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: '設定',
              ),
            ],
            currentIndex: _currentIndex,
            onTap: (index) {
              HapticFeedback.lightImpact();
              setState(() {
                _currentIndex = index;
              });
            },
          ),
        ],
      ),
    );
  }
}
