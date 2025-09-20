# دليل الترجمة مع خط Cairo - Localized Font Guide

## ✅ تم إعداد النظام بنجاح!

تم إعداد نظام ترجمة متكامل مع خط Cairo Play الذي يدعم تغيير اللغة مع الحفاظ على الخط والاتجاه الصحيح للنص.

## الميزات الجديدة

### 1. **نظام ترجمة محسن**
- دعم كامل للعربية والإنجليزية
- تغيير تلقائي لاتجاه النص (RTL/LTR)
- تطبيق خط Cairo على جميع النصوص المترجمة

### 2. **Widgets مخصصة للترجمة**
- `LocalizedText` - نص مترجم عادي
- `LocalizedHeading1/2/3` - عناوين مترجمة
- `LocalizedBodyText` - نص جسم مترجم
- `LocalizedButtonText` - نص أزرار مترجم
- `LanguageSwitcherEnhanced` - مبدل لغة محسن

### 3. **أنماط نص محسنة**
- `LocalizedTextStyles` - أنماط نص مع دعم الترجمة
- اتجاه نص تلقائي حسب اللغة
- دعم جميع أوزان خط Cairo

## كيفية الاستخدام

### 1. استخدام النصوص المترجمة

```dart
import 'package:ui_doc/core/widgets/localized_text.dart';

// نص عادي مترجم
LocalizedText('welcome')

// عنوان مترجم
LocalizedHeading1('dashboard')
LocalizedHeading2('profile')

// نص جسم مترجم
LocalizedBodyText('onboardingDesc1')

// نص زر مترجم
LocalizedButtonText('save')
```

### 2. استخدام أنماط النص المحسنة

```dart
import 'package:ui_doc/core/constants/localized_text_styles.dart';

// استخدام أنماط محددة مسبقاً
Text('مرحباً', style: LocalizedTextStyles.heading1)
Text('نص عادي', style: LocalizedTextStyles.bodyLarge)

// استخدام نمط مخصص
Text('نص مخصص', style: LocalizedTextStyles.localizedText(
  fontSize: 18,
  fontWeight: AppFonts.semiBold,
  color: Colors.blue,
))
```

### 3. استخدام مبدل اللغة

```dart
import 'package:ui_doc/core/widgets/language_switcher_enhanced.dart';

// في AppBar
AppBar(
  title: const LocalizedText('appName'),
  actions: [
    const LanguageSwitcherEnhanced(),
  ],
)

// في أي مكان آخر
const LanguageSwitcherEnhanced(
  showLabel: true,
  showFlag: true,
  textColor: Colors.white,
  backgroundColor: Colors.blue,
)
```

## كيفية الاختبار

### 1. تشغيل شاشة الاختبار المترجمة
```bash
flutter run lib/test_localized_font_main.dart
```

### 2. تشغيل التطبيق العادي
```bash
flutter run
```

## الملفات الجديدة

### Widgets
- `lib/core/widgets/localized_text.dart` - Widgets النصوص المترجمة
- `lib/core/widgets/language_switcher_enhanced.dart` - مبدل اللغة المحسن

### Constants
- `lib/core/constants/localized_text_styles.dart` - أنماط النص المترجمة

### Examples
- `lib/examples/localized_font_example.dart` - مثال شامل للترجمة
- `lib/test_localized_font_main.dart` - ملف اختبار الترجمة

## كيفية إضافة ترجمات جديدة

### 1. إضافة مفتاح ترجمة جديد

في `lib/core/translations/app_translations.dart`:

```dart
// العربية
'newKey': 'النص العربي',

// الإنجليزية  
'newKey': 'English Text',
```

### 2. استخدام المفتاح الجديد

```dart
LocalizedText('newKey')
```

## الميزات المتقدمة

### 1. تغيير اتجاه النص تلقائياً
النظام يغير اتجاه النص تلقائياً حسب اللغة:
- العربية: من اليمين إلى اليسار (RTL)
- الإنجليزية: من اليسار إلى اليمين (LTR)

### 2. دعم جميع أوزان الخط
- Light (300)
- Regular (400)
- Medium (500)
- SemiBold (600)
- Bold (700)
- ExtraBold (800)
- Black (900)

### 3. تحديث تلقائي للواجهة
عند تغيير اللغة، جميع النصوص تتحدث تلقائياً مع الحفاظ على خط Cairo.

## استكشاف الأخطاء

### إذا لم تظهر الترجمة:
1. تأكد من إضافة المفتاح في ملف الترجمة
2. تأكد من استخدام `LocalizedText` بدلاً من `Text`
3. أعد تشغيل التطبيق

### إذا لم يظهر الخط:
1. تأكد من وجود ملفات الخط في `assets/fonts/`
2. قم بتشغيل `flutter clean` ثم `flutter pub get`
3. أعد تشغيل التطبيق

## ملاحظات مهمة

- جميع النصوص يجب استخدام `LocalizedText` للترجمة
- الخط يطبق تلقائياً على جميع النصوص المترجمة
- اتجاه النص يتغير تلقائياً حسب اللغة
- النظام يدعم التحديث المباشر عند تغيير اللغة
