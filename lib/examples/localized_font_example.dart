import 'package:flutter/material.dart';
import 'package:ui_doc/core/constants/fonts.dart';
import 'package:ui_doc/core/widgets/language_switcher_enhanced.dart';
import 'package:ui_doc/core/widgets/localized_text.dart' hide LocalizedText;
import 'package:ui_doc/theme/app_theme.dart';

class LocalizedFontExample extends StatelessWidget {
  const LocalizedFontExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const LocalizedText('appName'),
        backgroundColor: AppTheme.surfaceContainer,
        actions: [
          const Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: LanguageSwitcherEnhanced(),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Heading Examples
            const LocalizedHeading1('dashboard'),
            const SizedBox(height: 16),

            const LocalizedHeading2('welcome'),
            const SizedBox(height: 8),

            const LocalizedHeading3('quickStats'),
            const SizedBox(height: 8),

            const LocalizedText('totalPatients'),
            const SizedBox(height: 24),

            // Body Text Examples
            const LocalizedBodyText('onboardingDesc1'),
            const SizedBox(height: 8),

            const LocalizedBodyText('onboardingDesc2'),
            const SizedBox(height: 8),

            const LocalizedBodyText('onboardingDesc3'),
            const SizedBox(height: 24),

            // Button Examples
            const LocalizedText('buttons', style: AppFonts.heading2),
            const SizedBox(height: 16),

            ElevatedButton(
              onPressed: () {},
              child: const LocalizedButtonText('save'),
            ),
            const SizedBox(height: 8),

            OutlinedButton(
              onPressed: () {},
              child: const LocalizedButtonText('cancel'),
            ),
            const SizedBox(height: 8),

            TextButton(
              onPressed: () {},
              child: const LocalizedButtonText('edit'),
            ),
            const SizedBox(height: 24),

            // Custom Text Styles with Translation
            const LocalizedText('customStyles', style: AppFonts.heading2),
            const SizedBox(height: 16),

            LocalizedText(
              'customText',
              style: TextStyle(
                fontFamily: AppFonts.cairo,
                fontSize: 18,
                fontWeight: AppFonts.semiBold,
                color: AppTheme.primary,
                letterSpacing: 0.5,
              ),
            ),
            const SizedBox(height: 8),

            LocalizedText(
              'anotherCustomText',
              style: TextStyle(
                fontFamily: AppFonts.cairo,
                fontSize: 16,
                fontWeight: AppFonts.light,
                color: AppTheme.textSecondary,
                fontStyle: FontStyle.italic,
              ),
            ),
            const SizedBox(height: 24),

            // Font Weights with Translation
            const LocalizedText('fontWeights', style: AppFonts.heading2),
            const SizedBox(height: 16),

            const LocalizedText(
              'lightText',
              style: TextStyle(
                fontFamily: AppFonts.cairo,
                fontWeight: AppFonts.light,
              ),
            ),
            const SizedBox(height: 4),

            const LocalizedText(
              'regularText',
              style: TextStyle(
                fontFamily: AppFonts.cairo,
                fontWeight: AppFonts.regular,
              ),
            ),
            const SizedBox(height: 4),

            const LocalizedText(
              'mediumText',
              style: TextStyle(
                fontFamily: AppFonts.cairo,
                fontWeight: AppFonts.medium,
              ),
            ),
            const SizedBox(height: 4),

            const LocalizedText(
              'semiBoldText',
              style: TextStyle(
                fontFamily: AppFonts.cairo,
                fontWeight: AppFonts.semiBold,
              ),
            ),
            const SizedBox(height: 4),

            const LocalizedText(
              'boldText',
              style: TextStyle(
                fontFamily: AppFonts.cairo,
                fontWeight: AppFonts.bold,
              ),
            ),
            const SizedBox(height: 4),

            const LocalizedText(
              'extraBoldText',
              style: TextStyle(
                fontFamily: AppFonts.cairo,
                fontWeight: AppFonts.extraBold,
              ),
            ),
            const SizedBox(height: 4),

            const LocalizedText(
              'blackText',
              style: TextStyle(
                fontFamily: AppFonts.cairo,
                fontWeight: AppFonts.black,
              ),
            ),
            const SizedBox(height: 24),

            // Language Info
            const LocalizedText('currentLanguage', style: AppFonts.heading2),
            const SizedBox(height: 16),

            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppTheme.surfaceVariant,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppTheme.border),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const LocalizedText('languageInfo'),
                  const SizedBox(height: 8),
                  const LocalizedText('fontInfo'),
                  const SizedBox(height: 8),
                  const LocalizedText('rtlSupport'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
