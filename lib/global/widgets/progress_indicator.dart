import 'package:flutter/material.dart';
import 'package:progress_indicators/progress_indicators.dart';

class MyProgressIndicator extends StatelessWidget{
  final Color color;
  final double size;
  const MyProgressIndicator(this.color, {Key? key, this.size = 40}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return JumpingDotsProgressIndicator(
      fontSize: size,
      color: color,
    );
  }

}