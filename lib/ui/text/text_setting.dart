import 'package:crystally/widgets/color_input_widget.dart';
import 'package:crystally/widgets/slider_input_widget.dart';
import 'package:flutter/material.dart';

import '../../widgets/text_input_widget.dart';
import '../setting.dart';

class TextSetting extends Setting {
  final TextEditingController textController = TextEditingController();

  Color currentColor = Colors.white;
  double currentGlow = 0;

  @override
  // ignore: overridden_fields
  Map<String, dynamic> json = {'text': ''};

  @override
  Widget build(onNavigation) {
    return ListView(children: [
      TextInputWidget(
        label: 'Nội dung',
        controller: textController,
      ),
      const SizedBox(height: 10.0),
      ColorInputWidget(
        label: 'Màu sắc',
        color: currentColor,
        onData: (value) {
          currentColor = value;
        },
      ),
      const SizedBox(height: 10.0),
      SliderInputWidget(
          label: 'Chóe sáng',
          value: currentGlow,
          max: 100,
          step: 5,
          onData: (value) {
            currentGlow = value;
          }),
      const SizedBox(height: 10.0),
      TextButton(
        style: TextButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: Colors.black,
        ),
        onPressed: () {
          json['text'] = textController.text;
          json['color'] = currentColor;
          json['glow'] = currentGlow;

          onNavigation();
        },
        child: const Text('TẠO MÀN HÌNH'),
      )
    ]);
  }
}
