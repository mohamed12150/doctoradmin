import 'package:get/get.dart';
import '../controllers/user_controller.dart';
import '../controllers/appointment_controller_new.dart';
import '../controllers/notification_controller.dart';
import '../controllers/dashboard_controller.dart';
import '../core/services/translation_service.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    // Initialize translation service first
    Get.put<TranslationService>(TranslationService(), permanent: true);

    // Initialize all controllers as permanent to avoid recreation
    Get.put<UserController>(UserController(), permanent: true);
    Get.put<AppointmentController>(AppointmentController(), permanent: true);
    Get.put<NotificationController>(NotificationController(), permanent: true);
    Get.put<DashboardController>(DashboardController(), permanent: true);
  }
}
