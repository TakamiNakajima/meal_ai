import 'package:flutter/material.dart';
import 'package:meal_ai/style/color.dart';
import 'package:table_calendar/table_calendar.dart';

enum PageState {
  /// 開始日選択中
  start,

  /// 終了日選択中
  end,

  /// 献立作成中
  generate,
}

class MenuCreationPage extends StatefulWidget {
  const MenuCreationPage({super.key});

  @override
  State<MenuCreationPage> createState() => _MenuCreationPageState();
}

class _MenuCreationPageState extends State<MenuCreationPage> {
  DateTime? rangeStartDay;
  DateTime? rangeEndDay;
  PageState pageState = PageState.start;
  bool isWhiteOut = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: Container(),
        backgroundColor: AppColor.bgWhite,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.close,
              color: AppColor.mainColor,
            ),
          )
        ],
      ),
      body: SafeArea(
        child: (pageState == PageState.start || pageState == PageState.end)

            /// 期間選択画面
            ? Stack(
                children: [
                  Column(
                    children: [
                      const SizedBox(height: 40),
                      Text((pageState == PageState.start) ? "開始日を選択してください" : "終了日を選択してください"),
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
                          rangeStartDay: rangeStartDay,
                          rangeEndDay: rangeEndDay,
                          rangeSelectionMode: RangeSelectionMode.enforced,
                          locale: 'ja_JP',
                          onRangeSelected: (start, end, focusedDay) {
                            setState(() {
                              rangeStartDay = start;
                              rangeEndDay = end;
                              isWhiteOut = true;

                              if (pageState == PageState.start) {
                                pageState = PageState.end;
                              } else if (pageState == PageState.end) {}
                            });

                            Future.delayed(const Duration(milliseconds: 300), () {
                              setState(() {
                                isWhiteOut = false;
                              });
                            });
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
                              if (rangeStartDay != null && rangeEndDay != null) {
                                if (day.isAfter(rangeStartDay!) && day.isBefore(rangeEndDay!)) {
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
                                } else if (day.isAtSameMomentAs(rangeStartDay!) ||
                                    day.isAtSameMomentAs(rangeEndDay!)) {
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

                      if (rangeStartDay != null && rangeEndDay != null)
                        SizedBox(
                          width: 200,
                          height: 48,
                          child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                pageState = PageState.generate;
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColor.mainColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(24),
                              ),
                            ),
                            child: const Text("作成"),
                          ),
                        )
                    ],
                  ),

                  // 白くするオーバーレイ
                  Visibility(
                    visible: isWhiteOut,
                    child: AnimatedOpacity(
                      opacity: isWhiteOut ? 1.0 : 0.0,
                      duration: const Duration(milliseconds: 1000),
                      child: Container(
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              )

            /// 献立生成画面
            : SingleChildScrollView(
                child: Center(
                child: Column(
                  children: [
                    const Text("開始日"),
                    Text(rangeStartDay.toString()),
                    const Text("終了日"),
                    Text(rangeEndDay.toString()),
                  ],
                ),
              )),
      ),
    );
  }
}
