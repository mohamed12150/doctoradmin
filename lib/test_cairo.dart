import 'package:flutter/material.dart';
import 'package:ui_doc/core/constants/fonts.dart';
import 'package:ui_doc/theme/app_theme.dart';

class TestCairoScreen extends StatelessWidget {
  const TestCairoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.theme(),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('اختبار خط Cairo'),
          backgroundColor: AppTheme.surfaceContainer,
        ),
        body: const Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('مرحباً بك في تطبيق UI Doc', style: AppFonts.heading1),
              SizedBox(height: 16),
              Text('هذا نص عادي باستخدام خط Cairo', style: AppFonts.bodyLarge),
              SizedBox(height: 8),
              Text('هذا نص صغير', style: AppFonts.bodySmall),
              SizedBox(height: 16),
              Text('أوزان مختلفة:', style: AppFonts.heading3),
              SizedBox(height: 8),
              Text(
                'نص خفيف',
                style: TextStyle(
                  fontFamily: AppFonts.cairo,
                  fontWeight: AppFonts.light,
                ),
              ),
              Text(
                'نص عادي',
                style: TextStyle(
                  fontFamily: AppFonts.cairo,
                  fontWeight: AppFonts.regular,
                ),
              ),
              Text(
                'نص متوسط',
                style: TextStyle(
                  fontFamily: AppFonts.cairo,
                  fontWeight: AppFonts.medium,
                ),
              ),
              Text(
                'نص شبه عريض',
                style: TextStyle(
                  fontFamily: AppFonts.cairo,
                  fontWeight: AppFonts.semiBold,
                ),
              ),
              Text(
                'نص عريض',
                style: TextStyle(
                  fontFamily: AppFonts.cairo,
                  fontWeight: AppFonts.bold,
                ),
              ),
              Text(
                'نص عريض جداً',
                style: TextStyle(
                  fontFamily: AppFonts.cairo,
                  fontWeight: AppFonts.extraBold,
                ),
              ),
              Text(
                'نص أسود',
                style: TextStyle(
                  fontFamily: AppFonts.cairo,
                  fontWeight: AppFonts.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
