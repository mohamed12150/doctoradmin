# خط Cairo Play - Cairo Play Font

هذا المجلد يحتوي على ملفات خط Cairo Play المطلوبة للتطبيق.

## ✅ الملفات المتوفرة

الملفات التالية متوفرة في مجلد `Cairo_Play/static/`:

- `CairoPlay-Regular.ttf` - الخط العادي
- `CairoPlay-Light.ttf` - الخط الخفيف (وزن 300)
- `CairoPlay-Medium.ttf` - الخط المتوسط (وزن 500)
- `CairoPlay-SemiBold.ttf` - الخط شبه العريض (وزن 600)
- `CairoPlay-Bold.ttf` - الخط العريض (وزن 700)
- `CairoPlay-ExtraBold.ttf` - الخط العريض جداً (وزن 800)
- `CairoPlay-Black.ttf` - الخط الأسود (وزن 900)

## كيفية الحصول على الملفات

1. قم بزيارة [Google Fonts - Cairo Play](https://fonts.google.com/specimen/Cairo+Play)
2. انقر على "Download family"
3. فك ضغط الملف المحمل
4. انسخ الملفات من مجلد `static` إلى هذا المجلد

## ملاحظات

- تأكد من أن أسماء الملفات مطابقة تماماً للأسماء المذكورة أعلاه
- بعد إضافة الملفات، قم بتشغيل `flutter pub get` لتحديث التبعيات
- يمكنك استخدام `AppFonts` class في الكود لسهولة استخدام الخط

## الاستخدام في الكود

```dart
import 'package:ui_doc/core/constants/fonts.dart';

// استخدام أنماط النص المحددة مسبقاً
Text('مرحباً', style: AppFonts.heading1)

// استخدام الخط مع خصائص مخصصة
Text('نص مخصص', style: TextStyle(
  fontFamily: AppFonts.cairo,
  fontSize: 18,
  fontWeight: AppFonts.semiBold,
))
```
