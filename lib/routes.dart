import 'dart:io' show Platform;

import 'ui/setting.dart';

import 'ui/text/text_screen.dart';
import 'ui/text/text_setting.dart';
import 'ui/clock/clock_screen.dart';
import 'ui/clock/clock_setting.dart';
import 'ui/candle/candle_setting.dart';
import 'ui/candle/candle_screen.dart';

class MyRoute {
  final String title;
  final String path;
  final Setting setting;
  final Function buildScreen;

  const MyRoute({
    required this.title,
    required this.path,
    required this.setting,
    required this.buildScreen,
  });
}

class Routes {
  static const String text = '/text';
  static const String clock = '/clock';
  static const String candle = '/candle';

  static final routes = <MyRoute>[
    MyRoute(
      title: 'Chạy chữ',
      path: text,
      setting: TextSetting(),
      buildScreen: (Map<String, dynamic> settings) =>
          TextScreen(settings: settings),
    ),
    MyRoute(
      title: 'Đồng hồ',
      path: clock,
      setting: ClockSetting(),
      buildScreen: (Map<String, dynamic> settings) =>
          ClockScreen(settings: settings),
    ),
    if (!Platform.isLinux)
      MyRoute(
        title: 'Thắp nến',
        path: candle,
        setting: CandleSetting(),
        buildScreen: (Map<String, dynamic> settings) =>
            CandleScreen(settings: settings),
      )
  ];
}
