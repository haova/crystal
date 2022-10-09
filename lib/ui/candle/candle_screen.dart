import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class CandleScreen extends StatefulWidget {
  final Map<String, dynamic> settings;

  const CandleScreen({super.key, required this.settings});

  @override
  State<CandleScreen> createState() => _CandleScreenState();
}

class _CandleScreenState extends State<CandleScreen> {
  late VideoPlayerController _controllerOn;
  late VideoPlayerController _controllerOff;

  bool isEnableCandle = false;

  @override
  void initState() {
    super.initState();
    _controllerOn = VideoPlayerController.asset('assets/videos/candles_on.webm')
      ..initialize().then((_) {
        setState(() {
          _controllerOn.setLooping(true);
          _controllerOn.play();
        });
      });

    _controllerOff =
        VideoPlayerController.asset('assets/videos/candles_off.webm')
          ..initialize().then((_) {
            setState(() {});
          });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isEnableCandle = !isEnableCandle;
        });
      },
      child: Stack(
        children: [
          if (isEnableCandle)
            SizedBox.expand(
              child: FittedBox(
                fit: BoxFit.cover,
                alignment: Alignment.topCenter,
                child: SizedBox(
                  width: _controllerOn.value.size?.width ?? 0,
                  height: _controllerOn.value.size?.height ?? 0,
                  child: VideoPlayer(_controllerOn),
                ),
              ),
            ),
          if (!isEnableCandle)
            SizedBox.expand(
              child: FittedBox(
                fit: BoxFit.cover,
                alignment: Alignment.topCenter,
                child: SizedBox(
                  width: _controllerOff.value.size?.width ?? 0,
                  height: _controllerOff.value.size?.height ?? 0,
                  child: VideoPlayer(_controllerOff),
                ),
              ),
            )
        ],
      ),
    );
  }
}
