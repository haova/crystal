import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class ColorInputWidget extends StatefulWidget {
  final String label;
  final Function onData;
  final Color color;

  const ColorInputWidget({
    super.key,
    this.label = '',
    required this.onData,
    this.color = Colors.white,
  });

  @override
  State<ColorInputWidget> createState() => _ColorInputWidgetState();
}

class _ColorInputWidgetState extends State<ColorInputWidget> {
  late Color currentColor;

  @override
  void initState() {
    super.initState();

    currentColor = widget.color;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          widget.label,
          style: const TextStyle(
            fontSize: 12,
          ),
        ),
        TextButton(
          onPressed: () {
            _showColorPicker();
          },
          style: TextButton.styleFrom(
            backgroundColor: currentColor,
          ),
          child: const Text(' '),
        ),
      ],
    );
  }

  void _showColorPicker() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          titlePadding: const EdgeInsets.all(0),
          contentPadding: const EdgeInsets.all(0),
          content: SingleChildScrollView(
            child: ColorPicker(
              pickerColor: Colors.white,
              onColorChanged: (value) {
                setState(() {
                  currentColor = value;
                  widget.onData(currentColor);
                });
              },
            ),
          ),
        );
      },
    );
  }
}
