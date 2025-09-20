import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui_doc/core/constants/fonts.dart';
import 'package:ui_doc/core/services/translation_service.dart';
import 'package:ui_doc/theme/app_theme.dart';

class LanguageSwitcherEnhanced extends StatelessWidget {
  final bool showLabel;
  final bool showFlag;
  final Color? textColor;
  final Color? backgroundColor;
  final EdgeInsets? padding;
  final BorderRadius? borderRadius;

  const LanguageSwitcherEnhanced({
    super.key,
    this.showLabel = true,
    this.showFlag = true,
    this.textColor,
    this.backgroundColor,
    this.padding,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final translationService = TranslationService.to;
      final currentLanguage = translationService.currentLanguage;
      final isRTL = translationService.isRTL;

      return Container(
        padding:
            padding ?? const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: backgroundColor ?? AppTheme.surfaceVariant,
          borderRadius: borderRadius ?? BorderRadius.circular(8),
          border: Border.all(color: AppTheme.border),
        ),
        child: InkWell(
          onTap: () => _showLanguageDialog(context),
          borderRadius: borderRadius ?? BorderRadius.circular(8),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (showFlag) ...[
                Text(
                  translationService.getLanguageFlag(currentLanguage),
                  style: const TextStyle(fontSize: 20),
                ),
                const SizedBox(width: 8),
              ],
              if (showLabel) ...[
                Text(
                  translationService.getLanguageName(currentLanguage),
                  style: TextStyle(
                    fontFamily: AppFonts.cairo,
                    fontSize: 14,
                    fontWeight: AppFonts.medium,
                    color: textColor ?? AppTheme.textPrimary,
                  ),
                ),
                const SizedBox(width: 4),
                Icon(
                  isRTL
                      ? Icons.keyboard_arrow_left
                      : Icons.keyboard_arrow_right,
                  size: 16,
                  color: textColor ?? AppTheme.textSecondary,
                ),
              ],
            ],
          ),
        ),
      );
    });
  }

  void _showLanguageDialog(BuildContext context) {
    final translationService = TranslationService.to;
    final supportedLanguages = translationService.getSupportedLanguages();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: LocalizedText(
          'selectLanguage',
          style: TextStyle(
            fontFamily: AppFonts.cairo,
            fontSize: 18,
            fontWeight: AppFonts.semiBold,
          ),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: supportedLanguages.map((language) {
            final isSelected =
                language['code'] == translationService.currentLanguage;

            return ListTile(
              leading: Text(
                language['flag']!,
                style: const TextStyle(fontSize: 24),
              ),
              title: Text(
                language['name']!,
                style: TextStyle(
                  fontFamily: AppFonts.cairo,
                  fontSize: 16,
                  fontWeight: isSelected ? AppFonts.semiBold : AppFonts.regular,
                  color: isSelected ? AppTheme.primary : AppTheme.textPrimary,
                ),
              ),
              trailing: isSelected
                  ? Icon(Icons.check, color: AppTheme.primary, size: 20)
                  : null,
              onTap: () {
                translationService.changeLanguage(language['code']!);
                Navigator.of(context).pop();
              },
            );
          }).toList(),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: LocalizedText(
              'cancel',
              style: TextStyle(
                fontFamily: AppFonts.cairo,
                color: AppTheme.textSecondary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class LocalizedText extends StatelessWidget {
  final String textKey;
  final TextStyle? style;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;
  final Map<String, String>? args;

  const LocalizedText(
    this.textKey, {
    super.key,
    this.style,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.args,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final translationService = TranslationService.to;
      final translatedText = textKey.tr;

      return Text(
        translatedText,
        style:
            style?.copyWith(fontFamily: AppFonts.cairo) ??
            TextStyle(fontFamily: AppFonts.cairo),
        textAlign:
            textAlign ??
            (translationService.isRTL ? TextAlign.right : TextAlign.left),
        maxLines: maxLines,
        overflow: overflow,
      );
    });
  }
}
