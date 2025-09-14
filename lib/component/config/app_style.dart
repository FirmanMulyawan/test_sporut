import 'package:flutter/material.dart';

class AppStyle {
  static Color textColor = const Color(0xff333333);
  static Color grey1 = const Color(0xff4F4F4F);
  static Color grey3 = const Color(0xff828282);
  static Color grey5 = const Color(0xffE0E0E0);
  static Color blue = const Color(0xff0A97B0);
  static Color blue1 = const Color(0xff2F80ED);
  static Color blue2 = const Color(0xff2D9CDB);
  static Color blue3 = const Color(0xff56CCF2);
  static Color whiteColor = Colors.white;
  static Color teal = const Color(0xff46B5A7);
  static Color yellow = const Color(0xffF2C94C);
  static Color orange = const Color(0xffF2994A);
  static Color red = const Color(0xffEB5757);
  static Color purple1 = const Color(0xff9B51E0);
  static Color purple2 = const Color(0xffBB6BD9);
  static Color green2 = const Color(0xff27AE60);
  static Color errorTextColor = const Color(0xffFF5252);
  static Color buttonDisabledShadowColor = const Color(0xffBDBDBD);

//
  static Color buttonDisabledColor = const Color(0xffCCDBD6);

  static Color homeYoutubeRed = const Color(0xffFD4D43);
  static Color homeYoutubeHover = const Color(0xffBE3A32);
  static Color homeYoutubeButton = const Color(0xffF3CB2E);
  static Color homeYoutubeShadow = const Color(0xffF68400);

  static Color dialogBgColor = const Color(0xff014F34).withValues(alpha: 0.4);

  // static const int _appthemePrimaryValue = 0xff5B6E96;
  // static const MaterialColor appTheme = MaterialColor(_appthemePrimaryValue, <int, Color>{
  //   50: Color(0xFFFCE4E5),
  //   100: Color(0xFFF8BCBF),
  //   200: Color(0xFFF39094),
  //   300: Color(0xFFEE6469),
  //   400: Color(0xFFEA4249),
  //   500: Color(_appthemePrimaryValue),
  //   600: Color(0xFFE31D24),
  //   700: Color(0xFFDF181F),
  //   800: Color(0xFFDB1419),
  //   900: Color(0xFFD50B0F),
  // });

  static OutlineInputBorder inputBorderTheme() {
    return OutlineInputBorder(
      borderSide: BorderSide(color: grey5, width: 1),
      borderRadius: const BorderRadius.all(Radius.circular(6)),
    );
  }

  static OutlineInputBorder errorBorderTheme() {
    return OutlineInputBorder(
      borderSide: BorderSide(color: errorTextColor, width: 1),
      borderRadius: const BorderRadius.all(Radius.circular(6)),
    );
  }

  static OutlineInputBorder disabledBorderTheme() {
    return OutlineInputBorder(
      borderSide: BorderSide(color: grey5, width: 1),
      borderRadius: const BorderRadius.all(Radius.circular(6)),
    );
  }

  // static BorderRadius borderRadiusVerySmall() => BorderRadius.circular(4.0);
  // static BorderRadius borderRadiusSmall() => BorderRadius.circular(8.0);
  // static BorderRadius borderRadiusMedium() => BorderRadius.circular(20.0);

  static ThemeData themeData(BuildContext context) {
    return ThemeData(
        useMaterial3: false,
        fontFamily: 'SourceSansPro',
        // primarySwatch: AppStyle.appTheme,
        textTheme: TextTheme(
            titleMedium: light(
          textColor: textColor,
          size: 14,
        )),
        inputDecorationTheme: InputDecorationTheme(
          // contentPadding: EdgeInsets.zero,
          contentPadding: EdgeInsets.symmetric(horizontal: 14),
          enabledBorder: inputBorderTheme(),
          border: inputBorderTheme(),
          focusedBorder: inputBorderTheme(),
          focusedErrorBorder: errorBorderTheme(),
          errorBorder: errorBorderTheme(),
          disabledBorder: disabledBorderTheme(),
          errorStyle: regular(
            textColor: AppStyle.errorTextColor,
            size: 12,
          ),
          floatingLabelStyle: TextStyle(
            color: textColor,
            fontWeight: FontWeight.w500,
            fontSize: 15,
          ),
          labelStyle: TextStyle(
            color: AppStyle.blue,
            fontWeight: FontWeight.w500,
            fontSize: 15,
          ),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          hintStyle: light(
            textColor: grey3,
            size: 14,
          ),
        ),
        filledButtonTheme: FilledButtonThemeData(
          style: FilledButton.styleFrom(
            minimumSize: const Size.fromHeight(50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
            ),
            disabledForegroundColor: AppStyle.whiteColor,
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
            ),
            side: BorderSide(color: grey5, width: 0.5),
            foregroundColor: textColor,
            minimumSize: const Size.fromHeight(44),
            disabledForegroundColor: AppStyle.whiteColor,
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            disabledForegroundColor: buttonDisabledColor,
          ),
        ),
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: AppStyle.blue,
        ));
  }

  static TextStyle light({
    Color? textColor,
    double size = 14,
    fontStyle = FontStyle.normal,
  }) {
    return TextStyle(
      fontSize: size,
      color: textColor ?? AppStyle.textColor,
      letterSpacing: 0,
      fontFamily: 'SourceSansPro',
      fontWeight: FontWeight.w400,
      fontStyle: fontStyle,
    );
  }

  static TextStyle regular({
    Color? textColor,
    double size = 14,
    double? height,
    fontStyle = FontStyle.normal,
  }) {
    return TextStyle(
      fontSize: size,
      color: textColor ?? AppStyle.textColor,
      letterSpacing: 0,
      height: height ?? 1.2,
      fontFamily: 'SourceSansPro',
      fontWeight: FontWeight.w500,
      fontStyle: fontStyle,
    );
  }

  static TextStyle medium({
    Color? textColor,
    double size = 14,
    fontStyle = FontStyle.normal,
  }) {
    return TextStyle(
      fontSize: size,
      color: textColor ?? AppStyle.textColor,
      letterSpacing: 0,
      fontFamily: 'SourceSansPro',
      fontWeight: FontWeight.w600,
      fontStyle: fontStyle,
    );
  }

  static TextStyle bold({
    Color? textColor,
    double size = 14,
    FontStyle fontStyle = FontStyle.normal,
  }) {
    return TextStyle(
      fontSize: size,
      color: textColor ?? AppStyle.textColor,
      letterSpacing: 0,
      fontFamily: 'SourceSansPro',
      fontWeight: FontWeight.bold,
      fontStyle: fontStyle,
    );
  }
}
