import 'package:flutter/material.dart';
import 'package:analog_clock/analog_clock.dart';

class ClockScreen extends StatefulWidget {
  final Map<String, dynamic> settings;

  const ClockScreen({super.key, required this.settings});

  @override
  State<ClockScreen> createState() => _ClockScreenState();
}

class _ClockScreenState extends State<ClockScreen> {
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(20.0),
      child: AnalogClock(
        isLive: true,
        hourHandColor: Colors.white,
        minuteHandColor: Colors.white,
        showSecondHand: true,
        numberColor: Colors.white,
        showNumbers: true,
        showAllNumbers: true,
        textScaleFactor: 1,
        showTicks: false,
        showDigitalClock: false,
      ),
    );
  }
}
