import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'colors.dart';

class ThemeConfig {
  // static final ThemeData themeData = ThemeData(
  //     useMaterial3: true,
  //     fontFamily: 'IRANSansX',
  //     colorScheme: ColorScheme(
  //         brightness: Brightness.light,
  //         primary: GlobalColors.primaryColor,
  //         onPrimary: GlobalColors.maniBackgroundColor,
  //         secondary: GlobalColors.secondPrimaryColor,
  //         onSecondary: GlobalColors.secondPrimaryColor,
  //         error: GlobalColors.errorColor,
  //         onError: GlobalColors.errorColor,
  //         background: GlobalColors.maniBackgroundColor,
  //         onBackground: GlobalColors.maniBackgroundColor,
  //         surface: GlobalColors.onSurfaceColor,
  //         onSurface: GlobalColors.onSurfaceColor)
  // );

  static ThemeData createTheme({
    required Brightness brightness,
    required Color background,
    required Color primaryText,
    Color? secondaryText,
    required Color accentColor,
    Color? divider,
    Color? buttonBackground,
    required Color buttonText,
    Color? cardBackground,
    Color? disabled,
    required Color error,
  }) {
    final baseTextTheme = brightness == Brightness.dark
        ? Typography.blackMountainView
        : Typography.whiteMountainView;

    final TextTheme myTextTheme = const TextTheme(
      bodySmall: TextStyle(fontSize: 12, overflow: TextOverflow.ellipsis),
      titleSmall: TextStyle(fontSize: 12),
      titleLarge: TextStyle(fontSize: 14),
    ).apply(
      fontFamily: 'IRANSansX',
    );

    return ThemeData(
      useMaterial3: true,
      fontFamily: 'IRANSansX',
      textTheme: myTextTheme,
      canvasColor: background,
      cardColor: cardBackground,
      dividerColor: divider,
      dividerTheme: DividerThemeData(
        color: divider,
        space: 1,
        thickness: 1,
      ),
      cardTheme: CardTheme(
        color: cardBackground,
        margin: EdgeInsets.zero,
        clipBehavior: Clip.antiAliasWithSaveLayer,
      ),
      primaryColor: accentColor,
      // textSelectionColor: accentColor,
      // textSelectionHandleColor: accentColor,
      // cursorColor: accentColor,
      textSelectionTheme: TextSelectionThemeData(
        selectionColor: accentColor,
        selectionHandleColor: accentColor,
        cursorColor: accentColor,
      ),
      appBarTheme: AppBarTheme(
        color: cardBackground,
        iconTheme: IconThemeData(
          color: secondaryText,
        ),
        toolbarTextStyle: TextTheme(
          bodyLarge: baseTextTheme.bodyLarge!.copyWith(
            color: secondaryText,
            fontFamily: 'IRANSans',
            fontSize: 18,
          ),
        ).bodyMedium,
        titleTextStyle: TextTheme(
          bodyLarge: baseTextTheme.bodyLarge!.copyWith(
            color: secondaryText,
            fontFamily: 'IRANSans',
            fontSize: 18,
          ),
        ).titleLarge,
      ),
      iconTheme: IconThemeData(
        color: secondaryText,
        size: 16.0,
      ),
      cupertinoOverrideTheme: CupertinoThemeData(
        brightness: brightness,
        primaryColor: accentColor,
      ),

      inputDecorationTheme: InputDecorationTheme(
        isDense: true,
        labelStyle: TextStyle(
          fontWeight: FontWeight.normal,
          fontSize: 14,
          fontFamily: 'IRANSans',
          color: primaryText,
        ),
        hintStyle: TextStyle(
          fontWeight: FontWeight.normal,
          fontSize: 14,
          fontFamily: 'IRANSans',
          color: primaryText.withOpacity(0.8),
        ),
        errorStyle: TextStyle(
          fontWeight: FontWeight.normal,
          fontSize: 12,
          fontFamily: 'IRANSans',
          color: error,
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: const BorderSide(width: 1, color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
        ),
        errorBorder: UnderlineInputBorder(
          borderSide: BorderSide(width: 1, color: error),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 1, color: error),
          borderRadius: BorderRadius.circular(10),
        ),
        contentPadding:
        const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(width: 1.0, color: accentColor),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      unselectedWidgetColor: hexToColor('#DADCDD'),
      switchTheme: SwitchThemeData(
        thumbColor: MaterialStateProperty.resolveWith<Color?>(
                (Set<MaterialState> states) {
              if (states.contains(MaterialState.disabled)) {
                return null;
              }
              if (states.contains(MaterialState.selected)) {
                return accentColor;
              }
              return null;
            }),
        trackColor: MaterialStateProperty.resolveWith<Color?>(
                (Set<MaterialState> states) {
              if (states.contains(MaterialState.disabled)) {
                return null;
              }
              if (states.contains(MaterialState.selected)) {
                return accentColor;
              }
              return null;
            }),
      ),
      radioTheme: RadioThemeData(
        fillColor: MaterialStateProperty.resolveWith<Color?>(
                (Set<MaterialState> states) {
              if (states.contains(MaterialState.disabled)) {
                return null;
              }
              if (states.contains(MaterialState.selected)) {
                return accentColor;
              }
              return null;
            }),
      ),
      checkboxTheme: CheckboxThemeData(
        checkColor: MaterialStateProperty.all(Colors.white),
        fillColor: MaterialStateProperty.resolveWith<Color?>(
                (Set<MaterialState> states) {
              if (states.contains(MaterialState.disabled)) {
                return null;
              }
              if (states.contains(MaterialState.selected)) {
                return accentColor;
              }
              return null;
            }),
      ),
      colorScheme: ColorScheme.fromSwatch()
          .copyWith(
        brightness: brightness,
        secondary: accentColor,
        onPrimary: secondaryText,
        onSecondary: accentColor,
        onSurface: secondaryText,
        primary: accentColor,
      )
          .copyWith(background: background)
          .copyWith(error: error),
    );
  }


  static ThemeData get lightTheme => createTheme(
    brightness: Brightness.light,
    background: GlobalColors.mainBackgroundColor,
    cardBackground: GlobalColors.mainBackgroundColor,
    primaryText: GlobalColors.mainBackgroundColor,
    secondaryText: GlobalColors.mainBackgroundColor,
    accentColor: GlobalColors.mainBackgroundColor,
    divider: GlobalColors.divider,
    buttonBackground: GlobalColors.secondBackgroundColor,
    buttonText: GlobalColors.whiteTextColor,
    disabled: GlobalColors.divider,
    error: GlobalColors.errorColor,
  );

  static ThemeData get darkTheme => createTheme(
    brightness: Brightness.dark,
    background: GlobalColors.mainBackgroundColor,
    cardBackground: GlobalColors.mainBackgroundColor,
    primaryText: GlobalColors.mainBackgroundColor,
    secondaryText: GlobalColors.mainBackgroundColor,
    accentColor: GlobalColors.mainBackgroundColor,
    divider: GlobalColors.divider,
    buttonBackground: GlobalColors.secondBackgroundColor,
    buttonText: GlobalColors.whiteTextColor,
    disabled: GlobalColors.divider,
    error: GlobalColors.errorColor,
  );
}
