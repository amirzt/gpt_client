import 'package:flutter/material.dart';

class GlobalColors {
  static Color mainBackgroundColor = const Color.fromARGB(255, 35,33,38);
  static Color secondBackgroundColor = const Color.fromARGB(255, 47, 47, 51);
  static Color thirdBackgroundColor = const Color.fromARGB(255, 32, 36, 45);
  static Color divider = const Color.fromARGB(255, 68, 81, 103);

  static Color selected = const Color.fromARGB(255, 252,250,253);
  static Color unSelected = const Color.fromARGB(255, 133,131,136);

  static Color primaryColor = const Color.fromARGB(255, 39,136,255);
  static Color complementaryColor = const Color.fromARGB(255, 39, 255, 216);
  static Color grey = const Color.fromARGB(255, 72, 72, 72);

  // text
  static Color borderColor = const Color.fromARGB(102, 26, 173, 125);
  static Color greenTextColor = const Color.fromARGB(255, 26, 173, 125);
  static Color whiteTextColor = const Color.fromARGB(255, 255, 255, 255);
  static Color bodyTextColor = const Color.fromARGB(255, 225, 225, 225);
  static Color fadeTextColor = const Color.fromARGB(255, 68, 81, 103);
  static Color blueTextColor = const Color.fromARGB(255, 39, 136, 255);

  // button
  static Color darkBlueButtonColor = const Color.fromARGB(255, 68, 81, 103);


  static Color transparentBackground = const Color.fromARGB(90, 0, 0, 0);
  static Color bottomSheetBackground = const Color.fromARGB(255, 0, 0, 0);

  static Color errorColor = Colors.redAccent;
  static Color successColor = Colors.greenAccent;


  // gradient
  static Color bubbleGradientStart = const Color.fromARGB(255, 26, 173, 125);
  static Color bubbleGradientEnd = const Color.fromARGB(255, 32, 155, 188);
}

Color hexToColor(String hex) {
  assert(RegExp(r'^#([0-9a-fA-F]{6})|([0-9a-fA-F]{8})$').hasMatch(hex),
  'hex color must be #rrggbb or #rrggbbaa');

  return Color(
    int.parse(hex.substring(1), radix: 16) +
        (hex.length == 7 ? 0xff000000 : 0x00000000),
  );
}