import 'package:get/get.dart';

class DashboardController extends GetxController {
  final RxInt _selectedBottomNavIndex = 0.obs;
  final RxBool _isLoading = false.obs;

  int get selectedBottomNavIndex => _selectedBottomNavIndex.value;
  bool get isLoading => _isLoading.value;

  void changeBottomNavIndex(int index) {
    _selectedBottomNavIndex.value = index;
  }

  void navigateToScreen(int index) {
    _selectedBottomNavIndex.value = index;
    switch (index) {
      case 0:
        Get.offNamed('/dashboard');
        break;
      case 1:
        Get.offNamed('/appointments');
        break;
      case 2:
        Get.offNamed('/profile');
        break;
    }
  }

  void setLoading(bool loading) {
    _isLoading.value = loading;
  }
}
