import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:ui_doc/examples/localized_font_example.dart';
import 'package:ui_doc/bindings/app_bindings.dart';
import 'package:ui_doc/core/translations/app_translations.dart';
import 'package:ui_doc/core/services/translation_service.dart';
import 'package:ui_doc/theme/app_theme.dart';

void main() {
  runApp(const LocalizedFontTestApp());
}

class LocalizedFontTestApp extends StatelessWidget {
  const LocalizedFontTestApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TranslationService>(
      builder: (translationService) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Localized Font Test',
          theme: AppTheme.theme(isRTL: translationService.isRTL),
          initialBinding: AppBindings(),
          home: const LocalizedFontExample(),
          translations: AppTranslations(),
          locale: translationService.currentLocale,
          fallbackLocale: const Locale('ar'),
          supportedLocales: TranslationService.supportedLocales,
          localizationsDelegates: [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
        );
      },
    );
  }
}
