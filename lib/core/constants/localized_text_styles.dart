import 'package:flutter/material.dart';
import 'package:ui_doc/core/constants/fonts.dart';
import 'package:ui_doc/core/services/translation_service.dart';

class LocalizedTextStyles {
  // Get current language direction
  static bool get isRTL => TranslationService.to.isRTL;

  // Get text direction
  static TextDirection get textDirection =>
      isRTL ? TextDirection.rtl : TextDirection.ltr;

  // Localized heading styles
  static TextStyle get heading1 => AppFonts.heading1;

  static TextStyle get heading2 => AppFonts.heading2;

  static TextStyle get heading3 => AppFonts.heading3;

  static TextStyle get heading4 => AppFonts.heading4;

  // Localized body text styles
  static TextStyle get bodyLarge => AppFonts.bodyLarge;

  static TextStyle get bodyMedium => AppFonts.bodyMedium;

  static TextStyle get bodySmall => AppFonts.bodySmall;

  // Localized button styles
  static TextStyle get button => AppFonts.button;

  static TextStyle get buttonSmall => AppFonts.buttonSmall;

  // Localized label styles
  static TextStyle get label => AppFonts.label;

  static TextStyle get caption => AppFonts.caption;

  static TextStyle get overline => AppFonts.overline;

  // Custom localized text style
  static TextStyle localizedText({
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
    double? letterSpacing,
    double? lineHeight,
    TextDecoration? decoration,
    FontStyle? fontStyle,
  }) {
    return TextStyle(
      fontFamily: AppFonts.cairo,
      fontSize: fontSize ?? AppFonts.base,
      fontWeight: fontWeight ?? AppFonts.regular,
      color: color,
      letterSpacing: letterSpacing,
      height: lineHeight,
      decoration: decoration,
      fontStyle: fontStyle,
    );
  }

  // Get localized text with automatic direction
  static Widget localizedTextWidget(
    String text, {
    TextStyle? style,
    TextAlign? textAlign,
    int? maxLines,
    TextOverflow? overflow,
    bool? softWrap,
  }) {
    return Text(
      text,
      style: style ?? bodyMedium,
      textAlign: textAlign ?? (isRTL ? TextAlign.right : TextAlign.left),
      maxLines: maxLines,
      overflow: overflow,
      softWrap: softWrap,
    );
  }
}
