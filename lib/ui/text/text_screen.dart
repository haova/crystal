import 'package:flutter/material.dart';
import '../../widgets/marquee.dart';

class TextScreen extends StatefulWidget {
  final Map<String, dynamic> settings;

  const TextScreen({super.key, required this.settings});

  @override
  State<TextScreen> createState() => _TextScreenState();
}

class _TextScreenState extends State<TextScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Marquee(
        text: '${widget.settings['text'] ?? ''} ',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 120,
          color: widget.settings['color'] ?? Colors.white,
        ),
        velocity: 120.0,
        blankSpace: 240.0,
        glow: widget.settings['glow'] ?? 0,
      ),
    );
  }
}
