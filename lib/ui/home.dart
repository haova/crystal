import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: const [
        Center(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Image(image: AssetImage('assets/images/full_logo.png')),
          ),
        ),
        Positioned(
          left: 32,
          top: 32,
          child: Image(
            image: AssetImage('assets/images/arrow.png'),
            width: 64,
          ),
        ),
        Positioned(
          top: 76,
          left: 100,
          child: Text(
            'Chọn hiệu ứng ở đây!',
            style: TextStyle(
              fontSize: 12,
            ),
          ),
        ),
      ],
    );
  }
}
