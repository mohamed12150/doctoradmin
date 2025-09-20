import 'package:flutter/material.dart';

class AppFonts {
  // Font Family
  static const String cairo = 'Cairo';

  // Font Weights
  static const FontWeight extraLight = FontWeight.w200;
  static const FontWeight light = FontWeight.w300;
  static const FontWeight regular = FontWeight.w400;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight semiBold = FontWeight.w600;
  static const FontWeight bold = FontWeight.w700;
  static const FontWeight extraBold = FontWeight.w800;
  static const FontWeight black = FontWeight.w900;

  // Font Sizes
  static const double xs = 12.0;
  static const double sm = 14.0;
  static const double base = 16.0;
  static const double lg = 18.0;
  static const double xl = 20.0;
  static const double xxl = 24.0;
  static const double xxxl = 32.0;

  // Text Styles
  static const TextStyle heading1 = TextStyle(
    fontFamily: cairo,
    fontSize: xxxl,
    fontWeight: bold,
    letterSpacing: -0.5,
  );

  static const TextStyle heading2 = TextStyle(
    fontFamily: cairo,
    fontSize: xxl,
    fontWeight: bold,
    letterSpacing: -0.5,
  );

  static const TextStyle heading3 = TextStyle(
    fontFamily: cairo,
    fontSize: xl,
    fontWeight: semiBold,
    letterSpacing: -0.3,
  );

  static const TextStyle heading4 = TextStyle(
    fontFamily: cairo,
    fontSize: lg,
    fontWeight: semiBold,
    letterSpacing: -0.2,
  );

  static const TextStyle bodyLarge = TextStyle(
    fontFamily: cairo,
    fontSize: base,
    fontWeight: regular,
    letterSpacing: -0.1,
  );

  static const TextStyle bodyMedium = TextStyle(
    fontFamily: cairo,
    fontSize: sm,
    fontWeight: regular,
    letterSpacing: -0.1,
  );

  static const TextStyle bodySmall = TextStyle(
    fontFamily: cairo,
    fontSize: xs,
    fontWeight: regular,
    letterSpacing: 0,
  );

  static const TextStyle caption = TextStyle(
    fontFamily: cairo,
    fontSize: xs,
    fontWeight: medium,
    letterSpacing: 0.1,
  );

  static const TextStyle button = TextStyle(
    fontFamily: cairo,
    fontSize: base,
    fontWeight: semiBold,
    letterSpacing: -0.2,
  );

  static const TextStyle buttonSmall = TextStyle(
    fontFamily: cairo,
    fontSize: sm,
    fontWeight: semiBold,
    letterSpacing: -0.2,
  );

  static const TextStyle label = TextStyle(
    fontFamily: cairo,
    fontSize: sm,
    fontWeight: medium,
    letterSpacing: 0,
  );

  static const TextStyle overline = TextStyle(
    fontFamily: cairo,
    fontSize: xs,
    fontWeight: medium,
    letterSpacing: 0.5,
  );
}
