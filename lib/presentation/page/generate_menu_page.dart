import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:meal_ai/common/enum/generate_page_state.dart';
import 'package:meal_ai/domain/generate_menu/generate_menu_notifier.dart';
import 'package:meal_ai/presentation/style/color.dart';
import 'package:meal_ai/presentation/widget/primary_button.dart';
import 'package:table_calendar/table_calendar.dart';

class GenerateMenuPage extends ConsumerStatefulWidget {
  const GenerateMenuPage({super.key});

  @override
  ConsumerState<GenerateMenuPage> createState() => _GenerateMenuPageState();
}

class _GenerateMenuPageState extends ConsumerState<GenerateMenuPage> {
  @override
  Widget build(BuildContext context) {
    final homePageProvider = ref.watch(generateMenuProvider);
    final homePageNotifier = ref.read(generateMenuProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: Container(),
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            onPressed: () {
              context.pop();
            },
            icon: const Icon(
              Icons.close,
              color: AppColor.mainColor,
            ),
          )
        ],
      ),
      body: SafeArea(
        child: (homePageProvider.pageState == GeneratePageState.start ||
                homePageProvider.pageState == GeneratePageState.end)

            /// 期間選択画面
            ? Stack(
                children: [
                  Column(
                    children: [
                      const SizedBox(height: 40),
                      Text((homePageProvider.pageState == GeneratePageState.start)
                          ? "開始日を選択してください"
                          : "終了日を選択してください"),
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: TableCalendar(
                          headerStyle: const HeaderStyle(
                            formatButtonVisible: false,
                            titleCentered: true,
                            leftChevronIcon: Icon(
                              size: 30,
                              Icons.chevron_left_rounded,
                              color: AppColor.mainColor,
                            ),
                            rightChevronIcon: Icon(
                              size: 30,
                              Icons.chevron_right_rounded,
                              color: AppColor.mainColor,
                            ),
                          ),
                          firstDay: DateTime.utc(2000, 1, 1),
                          lastDay: DateTime.utc(2030, 12, 31),
                          focusedDay: DateTime.now(),
                          rangeStartDay: homePageProvider.rangeStartDay,
                          rangeEndDay: homePageProvider.rangeEndDay,
                          rangeSelectionMode: RangeSelectionMode.enforced,
                          locale: 'ja_JP',
                          onRangeSelected: (start, end, focusedDay) {
                            HapticFeedback.lightImpact();
                            homePageNotifier.onSelectDate(start, end);
                          },
                          calendarBuilders: CalendarBuilders(
                            todayBuilder: (context, todayDay, focusDay) => Center(
                              child: Text(
                                todayDay.day.toString(),
                                style: const TextStyle(color: AppColor.mainColor, fontSize: 16),
                              ),
                            ),
                            rangeStartBuilder: (context, day, focusedDay) {
                              return Center(
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: AppColor.mainColor.withOpacity(0.7),
                                    shape: BoxShape.circle,
                                  ),
                                  child: Center(
                                    child: Text(
                                      '${day.day}',
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                            rangeEndBuilder: (context, day, focusedDay) {
                              return Center(
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: AppColor.mainColor.withOpacity(0.7),
                                    shape: BoxShape.circle,
                                  ),
                                  child: Center(
                                    child: Text(
                                      '${day.day}',
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                            rangeHighlightBuilder: (context, day, focusedDay) {
                              if (homePageProvider.rangeStartDay != null &&
                                  homePageProvider.rangeEndDay != null) {
                                if (day.isAfter(homePageProvider.rangeStartDay!) &&
                                    day.isBefore(homePageProvider.rangeEndDay!)) {
                                  return Container(
                                    decoration: BoxDecoration(
                                      color: AppColor.mainColor.withOpacity(0.3),
                                      shape: BoxShape.circle,
                                    ),
                                    child: Center(
                                      child: Text(
                                        '${day.day}',
                                        style: const TextStyle(
                                          color: Colors.grey,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  );
                                } else if (day.isAtSameMomentAs(homePageProvider.rangeStartDay!) ||
                                    day.isAtSameMomentAs(homePageProvider.rangeEndDay!)) {
                                  // 範囲開始または範囲終了日の場合
                                  return Container(
                                    decoration: BoxDecoration(
                                      color: Colors.red.withOpacity(0.3),
                                      shape: BoxShape.circle,
                                    ),
                                    child: Center(
                                      child: Text(
                                        '${day.day}',
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  );
                                }
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                      const SizedBox(height: 40),
                      if (homePageProvider.rangeStartDay != null && homePageProvider.rangeEndDay != null)
                        PrimaryButton(title: "作成", onTap: () {
                          HapticFeedback.lightImpact();

                          // setState(() {
                          //   homePageProvider.pageState = PageState.generate;
                          // });
                        })
                    ],
                  ),
                ],
              )

            /// 献立生成画面
            : SingleChildScrollView(
                child: Center(
                child: Column(
                  children: [
                    const Text("開始日"),
                    Text(homePageProvider.rangeStartDay.toString()),
                    const Text("終了日"),
                    Text(homePageProvider.rangeEndDay.toString()),
                  ],
                ),
              )),
      ),
    );
  }
}
