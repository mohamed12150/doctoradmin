import 'package:flutter/material.dart';
import 'package:ui_doc/core/constants/fonts.dart';
import 'package:ui_doc/theme/app_theme.dart';

class CairoFontExample extends StatelessWidget {
  const CairoFontExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('مثال على خط Cairo'),
        backgroundColor: AppTheme.surfaceContainer,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Heading Examples
            Text('العناوين - Headings', style: AppFonts.heading2),
            const SizedBox(height: 16),

            Text('العنوان الرئيسي', style: AppFonts.heading1),
            const SizedBox(height: 8),

            Text('العنوان الثانوي', style: AppFonts.heading2),
            const SizedBox(height: 8),

            Text('العنوان الفرعي', style: AppFonts.heading3),
            const SizedBox(height: 8),

            Text('العنوان الصغير', style: AppFonts.heading4),
            const SizedBox(height: 24),

            // Body Text Examples
            Text('النصوص - Body Text', style: AppFonts.heading2),
            const SizedBox(height: 16),

            Text('هذا نص كبير باستخدام خط Cairo', style: AppFonts.bodyLarge),
            const SizedBox(height: 8),

            Text('هذا نص متوسط باستخدام خط Cairo', style: AppFonts.bodyMedium),
            const SizedBox(height: 8),

            Text('هذا نص صغير باستخدام خط Cairo', style: AppFonts.bodySmall),
            const SizedBox(height: 24),

            // Button Examples
            Text('الأزرار - Buttons', style: AppFonts.heading2),
            const SizedBox(height: 16),

            ElevatedButton(
              onPressed: () {},
              child: Text('زر عادي', style: AppFonts.button),
            ),
            const SizedBox(height: 8),

            OutlinedButton(
              onPressed: () {},
              child: Text('زر محدد', style: AppFonts.button),
            ),
            const SizedBox(height: 8),

            TextButton(
              onPressed: () {},
              child: Text('زر نص', style: AppFonts.buttonSmall),
            ),
            const SizedBox(height: 24),

            // Custom Text Styles
            Text('أنماط مخصصة - Custom Styles', style: AppFonts.heading2),
            const SizedBox(height: 16),

            Text(
              'نص بخاصية مخصصة',
              style: TextStyle(
                fontFamily: AppFonts.cairo,
                fontSize: 18,
                fontWeight: AppFonts.semiBold,
                color: AppTheme.primary,
                letterSpacing: 0.5,
              ),
            ),
            const SizedBox(height: 8),

            Text(
              'نص بخاصية مخصصة أخرى',
              style: TextStyle(
                fontFamily: AppFonts.cairo,
                fontSize: 16,
                fontWeight: AppFonts.light,
                color: AppTheme.textSecondary,
                fontStyle: FontStyle.italic,
              ),
            ),
            const SizedBox(height: 24),

            // Font Weights
            Text('أوزان الخط - Font Weights', style: AppFonts.heading2),
            const SizedBox(height: 16),

            Text(
              'نص خفيف - Light',
              style: TextStyle(
                fontFamily: AppFonts.cairo,
                fontWeight: AppFonts.light,
              ),
            ),
            const SizedBox(height: 4),

            Text(
              'نص عادي - Regular',
              style: TextStyle(
                fontFamily: AppFonts.cairo,
                fontWeight: AppFonts.regular,
              ),
            ),
            const SizedBox(height: 4),

            Text(
              'نص متوسط - Medium',
              style: TextStyle(
                fontFamily: AppFonts.cairo,
                fontWeight: AppFonts.medium,
              ),
            ),
            const SizedBox(height: 4),

            Text(
              'نص شبه عريض - SemiBold',
              style: TextStyle(
                fontFamily: AppFonts.cairo,
                fontWeight: AppFonts.semiBold,
              ),
            ),
            const SizedBox(height: 4),

            Text(
              'نص عريض - Bold',
              style: TextStyle(
                fontFamily: AppFonts.cairo,
                fontWeight: AppFonts.bold,
              ),
            ),
            const SizedBox(height: 4),

            Text(
              'نص عريض جداً - ExtraBold',
              style: TextStyle(
                fontFamily: AppFonts.cairo,
                fontWeight: AppFonts.extraBold,
              ),
            ),
            const SizedBox(height: 4),

            Text(
              'نص أسود - Black',
              style: TextStyle(
                fontFamily: AppFonts.cairo,
                fontWeight: AppFonts.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
