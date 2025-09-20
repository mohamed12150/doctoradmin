import '../../../widgets/error_handling.dart';
import '../../../core/constants/index.dart';

class AppointmentFunctions {
  static void acceptAppointment(String appointmentId) {
    // TODO: Implement API call to accept appointment
    ErrorHandling.showSuccessSnackbar(
      title: AppStrings.success,
      message: AppStrings.appointmentAccepted,
    );
  }

  static void declineAppointment(String appointmentId) {
    // TODO: Implement API call to decline appointment
    ErrorHandling.showSuccessSnackbar(
      title: AppStrings.success,
      message: AppStrings.appointmentDeclined,
    );
  }

  static void rescheduleAppointment(String appointmentId) {
    // TODO: Implement reschedule dialog
    ErrorHandling.showInfoSnackbar(
      title: AppStrings.info,
      message: 'Reschedule functionality will be implemented',
    );
  }

  static void joinSession(String appointmentId) {
    // TODO: Implement join session functionality
    ErrorHandling.showInfoSnackbar(
      title: AppStrings.info,
      message: 'Join session functionality will be implemented',
    );
  }

  static void viewAppointmentDetails(String appointmentId) {
    // TODO: Implement view details functionality
    ErrorHandling.showInfoSnackbar(
      title: AppStrings.info,
      message: 'View details functionality will be implemented',
    );
  }

  static void showRescheduleDialog(String appointmentId) {
    ErrorHandling.showConfirmationDialog(
      title: AppStrings.reschedule,
      message: 'Are you sure you want to reschedule this appointment?',
      confirmText: AppStrings.reschedule,
      cancelText: AppStrings.cancel,
      onConfirm: () {
        rescheduleAppointment(appointmentId);
      },
    );
  }

  static void showDeclineDialog(String appointmentId) {
    ErrorHandling.showConfirmationDialog(
      title: AppStrings.decline,
      message: 'Are you sure you want to decline this appointment?',
      confirmText: AppStrings.decline,
      cancelText: AppStrings.cancel,
      onConfirm: () {
        declineAppointment(appointmentId);
      },
    );
  }

  static void showAcceptDialog(String appointmentId) {
    ErrorHandling.showConfirmationDialog(
      title: AppStrings.accept,
      message: 'Are you sure you want to accept this appointment?',
      confirmText: AppStrings.accept,
      cancelText: AppStrings.cancel,
      onConfirm: () {
        acceptAppointment(appointmentId);
      },
    );
  }
}
