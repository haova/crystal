import 'package:flutter/material.dart';

class TextInputWidget extends StatelessWidget {
  final String label;
  final TextEditingController? controller;

  const TextInputWidget({super.key, this.label = '', this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
        border: const OutlineInputBorder(),
      ),
    );
  }
}
