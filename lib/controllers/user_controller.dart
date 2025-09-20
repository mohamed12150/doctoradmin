import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../core/models/index.dart';
import '../widgets/error_handling.dart';
import '../screens/profile/data/profile_data.dart';

class UserController extends GetxController {
  final Rx<UserModel?> _user = Rx<UserModel?>(null);
  final RxBool _isLoading = false.obs;
  final RxBool _isEditing = false.obs;

  UserModel? get user => _user.value;
  bool get isLoading => _isLoading.value;
  bool get isEditMode => _isEditing.value;

  @override
  void onInit() {
    super.onInit();
    if (_user.value == null) {
      loadUserData();
    }
  }

  Future<void> loadUserData() async {
    _isLoading.value = true;
    try {
      final prefs = await SharedPreferences.getInstance();
      final userJson = prefs.getString('user_data');

      if (userJson != null) {
        final userData = json.decode(userJson);
        _user.value = UserModel.fromJson(userData);
        ErrorHandling.showSuccessSnackbar(
          title: 'Success',
          message: 'User data loaded successfully',
        );
      } else {
        // Default user data
        _user.value = ProfileData.getMockUser();
        await saveUserData();
        ErrorHandling.showInfoSnackbar(
          title: 'Welcome',
          message: 'Welcome to the app! Your profile has been set up.',
        );
      }
    } catch (e) {
      ErrorHandling.handleApiError(e);
    } finally {
      _isLoading.value = false;
    }
  }

  Future<void> saveUserData() async {
    if (_user.value == null) return;
    
    try {
      final prefs = await SharedPreferences.getInstance();
      final userJson = json.encode(_user.value!.toJson());
      await prefs.setString('user_data', userJson);
      ErrorHandling.showSuccessSnackbar(
        title: 'Success',
        message: 'User data saved successfully',
      );
    } catch (e) {
      ErrorHandling.handleApiError(e);
    }
  }

  void toggleEditMode() {
    _isEditing.value = !_isEditing.value;
  }

  void updateUser(UserModel newUser) {
    _user.value = newUser;
  }

  void updateUserField(String field, dynamic value) {
    if (_user.value == null) return;
    
    _user.value = _user.value!.copyWith(
      id: field == 'id' ? value : _user.value!.id,
      name: field == 'name' ? value : _user.value!.name,
      email: field == 'email' ? value : _user.value!.email,
      phone: field == 'phone' ? value : _user.value!.phone,
      specialization: field == 'specialization' ? value : _user.value!.specialization,
      experience: field == 'experience' ? value : _user.value!.experience,
      location: field == 'location' ? value : _user.value!.location,
      bio: field == 'bio' ? value : _user.value!.bio,
      avatar: field == 'avatar' ? value : _user.value!.avatar,
      updatedAt: DateTime.now(),
    );
  }
}
