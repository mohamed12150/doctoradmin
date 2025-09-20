import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui_doc/core/constants/localized_text_styles.dart';

class LocalizedText extends StatelessWidget {
  final String textKey;
  final TextStyle? style;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;
  final bool? softWrap;
  final Map<String, String>? args;

  const LocalizedText(
    this.textKey, {
    super.key,
    this.style,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.softWrap,
    this.args,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final translatedText = textKey.tr;

      return LocalizedTextStyles.localizedTextWidget(
        translatedText,
        style: style,
        textAlign: textAlign,
        maxLines: maxLines,
        overflow: overflow,
        softWrap: softWrap,
      );
    });
  }
}

class LocalizedHeading1 extends StatelessWidget {
  final String textKey;
  final Color? color;
  final TextAlign? textAlign;
  final Map<String, String>? args;

  const LocalizedHeading1(
    this.textKey, {
    super.key,
    this.color,
    this.textAlign,
    this.args,
  });

  @override
  Widget build(BuildContext context) {
    return LocalizedText(
      textKey,
      style: LocalizedTextStyles.heading1.copyWith(color: color),
      textAlign: textAlign,
      args: args,
    );
  }
}

class LocalizedHeading2 extends StatelessWidget {
  final String textKey;
  final Color? color;
  final TextAlign? textAlign;
  final Map<String, String>? args;

  const LocalizedHeading2(
    this.textKey, {
    super.key,
    this.color,
    this.textAlign,
    this.args,
  });

  @override
  Widget build(BuildContext context) {
    return LocalizedText(
      textKey,
      style: LocalizedTextStyles.heading2.copyWith(color: color),
      textAlign: textAlign,
      args: args,
    );
  }
}

class LocalizedHeading3 extends StatelessWidget {
  final String textKey;
  final Color? color;
  final TextAlign? textAlign;
  final Map<String, String>? args;

  const LocalizedHeading3(
    this.textKey, {
    super.key,
    this.color,
    this.textAlign,
    this.args,
  });

  @override
  Widget build(BuildContext context) {
    return LocalizedText(
      textKey,
      style: LocalizedTextStyles.heading3.copyWith(color: color),
      textAlign: textAlign,
      args: args,
    );
  }
}

class LocalizedBodyText extends StatelessWidget {
  final String textKey;
  final Color? color;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;
  final Map<String, String>? args;

  const LocalizedBodyText(
    this.textKey, {
    super.key,
    this.color,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.args,
  });

  @override
  Widget build(BuildContext context) {
    return LocalizedText(
      textKey,
      style: LocalizedTextStyles.bodyMedium.copyWith(color: color),
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
      args: args,
    );
  }
}

class LocalizedButtonText extends StatelessWidget {
  final String textKey;
  final Color? color;
  final Map<String, String>? args;

  const LocalizedButtonText(this.textKey, {super.key, this.color, this.args});

  @override
  Widget build(BuildContext context) {
    return LocalizedText(
      textKey,
      style: LocalizedTextStyles.button.copyWith(color: color),
      args: args,
    );
  }
}
