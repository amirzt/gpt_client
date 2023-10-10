import 'package:flutter/material.dart';
import 'package:progress_indicators/progress_indicators.dart';

class MyProgressIndicator extends StatelessWidget{
  final Color color;
  const MyProgressIndicator(this.color, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return JumpingDotsProgressIndicator(
      fontSize: 40,
      color: color,
    );
  }

}