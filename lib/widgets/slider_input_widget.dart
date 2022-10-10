import 'package:flutter/material.dart';

class SliderInputWidget extends StatefulWidget {
  final String label;
  final double value;
  final double max;
  final double step;
  final Function onData;

  const SliderInputWidget({
    super.key,
    this.value = 0,
    required this.label,
    this.max = 10,
    this.step = 1,
    required this.onData,
  });

  @override
  State<SliderInputWidget> createState() => _SliderInputWidgetState();
}

class _SliderInputWidgetState extends State<SliderInputWidget> {
  late double currentValue;

  @override
  void initState() {
    super.initState();

    currentValue = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            widget.label,
            style: const TextStyle(
              fontSize: 12,
            ),
          ),
        ),
        Slider(
          value: currentValue,
          max: widget.max,
          divisions: (widget.max / widget.step).round(),
          label: currentValue.toString(),
          onChanged: (double value) {
            setState(() {
              currentValue = value;
              widget.onData(value);
            });
          },
        ),
      ],
    );
  }
}
