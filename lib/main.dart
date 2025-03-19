import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:meal_ai/firebase_options.dart';
import 'package:meal_ai/presentation/style/color.dart';
import 'package:meal_ai/presentation/util/screen_util.dart';
import 'package:meal_ai/presentation/shopping/shopping_page.dart';
import 'package:meal_ai/presentation/home/home_page.dart';
import 'package:meal_ai/presentation/menu_list/menu_list_page.dart';
import 'package:meal_ai/presentation/setting/setting_page.dart';
import 'package:meal_ai/presentation/util/router.dart';

import 'domain/healthcare/healthcare_usecase.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: '.env');
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

    return MaterialApp.router(
      routerDelegate: goRouter.routerDelegate,
      routeInformationParser: goRouter.routeInformationParser,
      routeInformationProvider: goRouter.routeInformationProvider,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: false,
        primaryColor: AppColor.mainColor,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      ),
    );
  }
}

class MyHomePage extends ConsumerStatefulWidget {
  const MyHomePage({super.key});

  @override
  ConsumerState<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends ConsumerState<MyHomePage> with WidgetsBindingObserver {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const HomePage(),
    const ShoppingPage(),
    const MenuListPage(),
    const SettingPage(),
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      // ここでBG→FG時の歩数取得処理を行う
      final stepUseCase = ref.watch(healthCareUseCase);
      stepUseCase.fetchStepFromHealthcare(
        DateTime(2025, 03, 19, 00, 00, 00),
        DateTime(2025, 03, 19, 23, 59, 59),
        'v2P8YWVkwhfHYmQREqaJ',
      );
    }
  }

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
