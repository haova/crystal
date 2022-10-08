import 'package:flutter/material.dart';

import '../../widgets/text_input_widget.dart';
import '../setting.dart';

class TextSetting extends Setting {
  final TextEditingController textController = TextEditingController();

  @override
  // ignore: overridden_fields
  Map<String, dynamic> json = {'text': ''};

  @override
  Widget build(onNavigation) {
    return ListView(children: [
      const SizedBox(height: 10.0),
      TextInputWidget(
        label: 'Nội dung',
        controller: textController,
      ),
      const SizedBox(height: 10.0),
      TextButton(
        style: TextButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: Colors.black,
        ),
        onPressed: () {
          json['text'] = textController.text;
          onNavigation();
        },
        child: const Text('TẠO MÀN HÌNH'),
      )
    ]);
  }
}
