import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TranslationService extends GetxController {
  static TranslationService get to => Get.find();

  final RxString _currentLanguage = 'ar'.obs;
  final Rx<Locale> _currentLocale = const Locale('ar').obs;

  String get currentLanguage => _currentLanguage.value;
  Locale get currentLocale => _currentLocale.value;

  // Supported languages
  static const List<Locale> supportedLocales = [
    Locale('ar', ''), // Arabic
    Locale('en', ''), // English
  ];

  // Language names
  static const Map<String, String> languageNames = {
    'ar': 'العربية',
    'en': 'English',
  };

  // Language flags
  static const Map<String, String> languageFlags = {'ar': '🇸🇦', 'en': '🇺🇸'};

  @override
  Future<void> onInit() async {
    super.onInit();
    await _loadSavedLanguage();
  }

  /// Load saved language from SharedPreferences
  Future<void> _loadSavedLanguage() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final savedLanguage = prefs.getString('selected_language') ?? 'ar';
      await changeLanguage(savedLanguage);
    } catch (e) {
      // If error, use default language
      await changeLanguage('ar');
    }
  }

  /// Save language to SharedPreferences
  Future<void> _saveLanguage(String languageCode) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('selected_language', languageCode);
    } catch (e) {
      debugPrint('Error saving language: $e');
    }
  }

  /// Change app language
  Future<void> changeLanguage(String languageCode) async {
    if (!languageNames.containsKey(languageCode)) {
      debugPrint('Unsupported language: $languageCode');
      return;
    }

    _currentLanguage.value = languageCode;
    _currentLocale.value = Locale(languageCode);

    // Update GetX locale
    Get.updateLocale(Locale(languageCode));

    // Force update the app
    update();

    // Save to preferences
    await _saveLanguage(languageCode);
  }

  /// Toggle between Arabic and English
  Future<void> toggleLanguage() async {
    final newLanguage = currentLanguage == 'ar' ? 'en' : 'ar';
    await changeLanguage(newLanguage);
  }

  /// Check if current language is RTL
  bool get isRTL => currentLanguage == 'ar';

  /// Get text direction
  TextDirection get textDirection =>
      isRTL ? TextDirection.rtl : TextDirection.ltr;

  /// Get language name by code
  String getLanguageName(String languageCode) {
    return languageNames[languageCode] ?? languageCode;
  }

  /// Get language flag by code
  String getLanguageFlag(String languageCode) {
    return languageFlags[languageCode] ?? '🌐';
  }

  /// Get all supported languages
  List<Map<String, String>> getSupportedLanguages() {
    return languageNames.entries
        .map(
          (entry) => {
            'code': entry.key,
            'name': entry.value,
            'flag': languageFlags[entry.key] ?? '🌐',
          },
        )
        .toList();
  }

  /// Check if language is supported
  bool isLanguageSupported(String languageCode) {
    return languageNames.containsKey(languageCode);
  }

  /// Get current language info
  Map<String, String> getCurrentLanguageInfo() {
    return {
      'code': currentLanguage,
      'name': getLanguageName(currentLanguage),
      'flag': getLanguageFlag(currentLanguage),
    };
  }
}
