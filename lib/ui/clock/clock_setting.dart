import 'package:flutter/material.dart';

import '../setting.dart';

class ClockSetting extends Setting {
  @override
  Widget build(onNavigation) {
    return ListView(children: [
      TextButton(
        style: TextButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: Colors.black,
        ),
        onPressed: () {
          onNavigation();
        },
        child: const Text('TẠO MÀN HÌNH'),
      )
    ]);
  }
}
