import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:ui_doc/screens/collage_degree.dart';
import 'package:ui_doc/screens/clinical_address.dart';
import 'package:ui_doc/screens/dashboard.dart';
import 'package:ui_doc/screens/hospital_license.dart';
import 'package:ui_doc/screens/notifications/notifications_screen.dart';
import 'package:ui_doc/screens/appointments/appointments_screen.dart';
import 'package:ui_doc/screens/appointments/create_appointment_screen.dart';
import 'package:ui_doc/screens/profile/profile_screen.dart';
import 'package:ui_doc/screens/availability.dart';
import 'package:ui_doc/theme/app_theme.dart';
import 'package:ui_doc/bindings/app_bindings.dart';
import 'package:ui_doc/core/translations/app_translations.dart';
import 'package:ui_doc/core/services/translation_service.dart';
import 'package:ui_doc/core/constants/app_strings.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TranslationService>(
      builder: (translationService) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: AppStrings.appName,
          theme: AppTheme.theme(isRTL: translationService.isRTL),
          initialBinding: AppBindings(),
          home: const _AppInitializer(),
          translations: AppTranslations(),
          locale: translationService.currentLocale,
          fallbackLocale: const Locale('ar'), // Fallback locale
          supportedLocales: TranslationService.supportedLocales,
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          getPages: [
            GetPage(name: '/', page: () => const DashboardScreen()),
            GetPage(name: '/dashboard', page: () => const DashboardScreen()),
            GetPage(
              name: '/appointments',
              page: () => const AppointmentsScreen(),
            ),
            GetPage(
              name: '/create-appointment',
              page: () => const CreateAppointmentScreen(),
            ),
            GetPage(name: '/profile', page: () => const ProfileScreen()),
            GetPage(
              name: '/availability',
              page: () => const AvailabilityScreen(),
            ),
            GetPage(
              name: '/notifications',
              page: () => const NotificationsScreen(),
            ),
            GetPage(
              name: '/hospital',
              page: () => const HospitalLicenseScreen(),
            ),
            GetPage(name: '/degree', page: () => const CollageDegree()),
            GetPage(name: '/clinic', page: () => const ClinicalAddressScreen()),
          ],
        );
      },
    );
  }
}

class _AppInitializer extends StatelessWidget {
  const _AppInitializer();

  @override
  Widget build(BuildContext context) {
    return const DashboardScreen();
  }
}
