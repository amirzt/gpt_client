import 'package:flutter/material.dart';

class GlobalColors {
  static Color maniBackgroundColor = const Color(0xFFF6F6F6);

  static Color primaryColor = const Color.fromARGB(255, 64, 248, 255);
  static Color secondPrimaryColor = const Color.fromARGB(255, 20, 66, 114);
  static Color thirdPrimaryColor = const Color.fromARGB(255, 32, 82, 149);
  static Color forthPrimaryColor = const Color.fromARGB(255, 44, 116, 179);

  static Color accentColor = const Color.fromARGB(255, 64, 248, 255);
  static Color buttonColor = const Color.fromARGB(255, 242,142,20);
  static Color selectedColor = const Color.fromARGB(255, 64, 248, 255);
  static Color darkBackground = const Color.fromARGB(255, 51, 51 ,51);
  static Color transparentBackground = const Color.fromARGB(90, 0, 0, 0);
  static Color bottomSheetBackground = const Color.fromARGB(255, 0, 0, 0);
  static Color purple = const Color.fromARGB(255, 122, 0, 130);
  static Color lightPurple = const Color.fromARGB(255, 209, 27, 220);


  static Color pink = const Color.fromARGB(255, 255, 64, 210);
  static Color yellow = const Color.fromARGB(255, 181, 181, 0);
  static Color yellowLight = const Color.fromARGB(255, 255, 228, 55);

  static Color onSurfaceColor = const Color(0xFF147079);

  static Color errorColor = Colors.redAccent;
  static Color successColor = Colors.greenAccent;

  static Color shopButton = const Color.fromARGB(255, 159, 77, 45);
  static Color shopBackground = const Color.fromARGB(255, 205, 154, 127);
  static Color shopSecondBackground = const Color.fromARGB(255, 42, 27, 96);


  static Color lightGray = const Color.fromARGB(255, 242, 241, 246);
  static Color mediumGray = const Color.fromARGB(255, 224, 223, 223);
  static Color darkGray = const Color(0xFF676666);
  static Color black = const Color(0xFF000000);
  static Color white = const Color(0xFFFFFFFF);

  static Color chartGradientEnd = const Color.fromARGB(255, 54, 209, 220);
  static Color chartGradientStart = const Color.fromARGB(255, 255, 255, 255);
}

Color hexToColor(String hex) {
  assert(RegExp(r'^#([0-9a-fA-F]{6})|([0-9a-fA-F]{8})$').hasMatch(hex),
  'hex color must be #rrggbb or #rrggbbaa');

  return Color(
    int.parse(hex.substring(1), radix: 16) +
        (hex.length == 7 ? 0xff000000 : 0x00000000),
  );
}