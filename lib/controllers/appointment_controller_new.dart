import 'package:get/get.dart';
import '../models/appointment_model.dart';
import '../widgets/error_handling.dart';
import '../screens/appointments/data/appointment_data.dart';
import '../core/constants/index.dart';

class AppointmentController extends GetxController {
  final RxList<AppointmentModel> _appointments = <AppointmentModel>[].obs;
  final RxList<AppointmentModel> _filteredAppointments =
      <AppointmentModel>[].obs;
  final RxString _selectedFilter = 'All'.obs;
  final RxString _searchQuery = ''.obs;
  final RxBool _isLoading = false.obs;

  List<AppointmentModel> get appointments => _appointments;
  List<AppointmentModel> get filteredAppointments => _filteredAppointments;
  String get selectedFilter => _selectedFilter.value;
  String get searchQuery => _searchQuery.value;
  bool get isLoading => _isLoading.value;
  List<String> get filterOptions => AppointmentData.getFilterOptions();

  @override
  void onInit() {
    super.onInit();
    if (_appointments.isEmpty) {
      loadAppointments();
    }
  }

  void loadAppointments() async {
    _isLoading.value = true;

    try {
      // Simulate API delay
      await Future.delayed(const Duration(seconds: 1));

      // Load mock data
      _appointments.value = AppointmentData.getMockAppointments();
      _filteredAppointments.value = _appointments;
      ErrorHandling.showSuccessSnackbar(
        title: AppStrings.success,
        message: AppStrings.dataLoadedSuccessfully,
      );
    } catch (e) {
      ErrorHandling.showErrorSnackbar(
        title: AppStrings.error,
        message: AppStrings.errorLoadingData,
      );
    } finally {
      _isLoading.value = false;
    }
  }

  void searchAppointments(String query) {
    _searchQuery.value = query;
    _filteredAppointments.value = AppointmentData.searchAppointments(
      _appointments,
      query,
    );
  }

  void filterAppointments(String filter) {
    _selectedFilter.value = filter;
    _filteredAppointments.value = AppointmentData.filterAppointments(
      _appointments,
      filter,
    );
  }

  void acceptAppointment(String appointmentId) {
    try {
      // TODO: Implement API call to accept appointment
      ErrorHandling.showSuccessSnackbar(
        title: AppStrings.success,
        message: AppStrings.appointmentAccepted,
      );
    } catch (e) {
      ErrorHandling.showErrorSnackbar(
        title: AppStrings.error,
        message: AppStrings.errorSavingData,
      );
    }
  }

  void declineAppointment(String appointmentId) {
    try {
      // TODO: Implement API call to decline appointment
      ErrorHandling.showSuccessSnackbar(
        title: AppStrings.success,
        message: AppStrings.appointmentDeclined,
      );
    } catch (e) {
      ErrorHandling.showErrorSnackbar(
        title: AppStrings.error,
        message: AppStrings.errorSavingData,
      );
    }
  }
}
