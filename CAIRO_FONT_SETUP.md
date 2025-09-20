# إعداد خط Cairo - Cairo Font Setup

## ✅ تم الإعداد بنجاح!

تم إعداد خط Cairo Play في المشروع بنجاح! الملفات التالية متوفرة:

- `CairoPlay-Regular.ttf`
- `CairoPlay-Light.ttf` (وزن 300)
- `CairoPlay-Medium.ttf` (وزن 500)
- `CairoPlay-SemiBold.ttf` (وزن 600)
- `CairoPlay-Bold.ttf` (وزن 700)
- `CairoPlay-ExtraBold.ttf` (وزن 800)
- `CairoPlay-Black.ttf` (وزن 900)

## كيفية الاختبار

### 1. تشغيل شاشة الاختبار
```bash
flutter run lib/test_cairo_main.dart
```

### 2. تشغيل التطبيق العادي
```bash
flutter run
```

## ما تم إعداده

✅ **تم تحديث `pubspec.yaml`** - إضافة تكوين خط Cairo
✅ **تم تحديث `app_theme.dart`** - تطبيق خط Cairo على جميع أنماط النص
✅ **تم إنشاء `AppFonts` class** - لسهولة استخدام الخط
✅ **تم إنشاء ملف مثال** - `lib/examples/cairo_font_example.dart`

## كيفية الاستخدام

### استخدام أنماط النص المحددة مسبقاً
```dart
import 'package:ui_doc/core/constants/fonts.dart';

Text('مرحباً', style: AppFonts.heading1)
Text('نص عادي', style: AppFonts.bodyLarge)
Text('زر', style: AppFonts.button)
```

### استخدام الخط مع خصائص مخصصة
```dart
Text('نص مخصص', style: TextStyle(
  fontFamily: AppFonts.cairo,
  fontSize: 18,
  fontWeight: AppFonts.semiBold,
  color: Colors.blue,
))
```

### استخدام أوزان الخط المختلفة
```dart
Text('نص خفيف', style: TextStyle(fontFamily: AppFonts.cairo, fontWeight: AppFonts.light))
Text('نص عادي', style: TextStyle(fontFamily: AppFonts.cairo, fontWeight: AppFonts.regular))
Text('نص متوسط', style: TextStyle(fontFamily: AppFonts.cairo, fontWeight: AppFonts.medium))
Text('نص شبه عريض', style: TextStyle(fontFamily: AppFonts.cairo, fontWeight: AppFonts.semiBold))
Text('نص عريض', style: TextStyle(fontFamily: AppFonts.cairo, fontWeight: AppFonts.bold))
Text('نص عريض جداً', style: TextStyle(fontFamily: AppFonts.cairo, fontWeight: AppFonts.extraBold))
Text('نص أسود', style: TextStyle(fontFamily: AppFonts.cairo, fontWeight: AppFonts.black))
```

## ملاحظات مهمة

- تأكد من أن أسماء ملفات الخط مطابقة تماماً للأسماء المذكورة
- بعد إضافة الملفات، قم بتشغيل `flutter clean` ثم `flutter pub get`
- يمكنك رؤية مثال على الاستخدام في `lib/examples/cairo_font_example.dart`

## استكشاف الأخطاء

إذا لم يظهر الخط بشكل صحيح:
1. تأكد من وجود الملفات في `assets/fonts/`
2. تأكد من صحة أسماء الملفات
3. قم بتشغيل `flutter clean` ثم `flutter pub get`
4. أعد تشغيل التطبيق
