import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constants/index.dart';
import '../../../core/widgets/index.dart';
import '../../../core/models/index.dart';
import '../data/profile_data.dart';

class ProfileFunctions {
  static void showEditAvatarDialog() {
    Get.dialog(
      AppDialog(
        title: 'تغيير الصورة الشخصية',
        description: 'اختر طريقة تحديث الصورة الشخصية',
        confirmText: 'من المعرض',
        cancelText: 'التقاط صورة',
        onConfirm: () {
          Get.back();
          // TODO: Implement gallery selection
          AppSnackbar.info(
            title: AppStrings.info,
            message: 'Gallery selection will be implemented',
          );
        },
        onCancel: () {
          Get.back();
          // TODO: Implement camera capture
          AppSnackbar.info(
            title: AppStrings.info,
            message: 'Camera capture will be implemented',
          );
        },
        icon: AppIcons.avatar,
      ),
    );
  }

  static void showLogoutDialog() {
    Get.dialog(
      AppConfirmDialog(
        title: 'تسجيل الخروج',
        description: 'هل أنت متأكد من أنك تريد تسجيل الخروج؟',
        confirmText: 'تسجيل الخروج',
        cancelText: 'إلغاء',
        isDestructive: true,
        onConfirm: () {
          Get.back();
          // TODO: Implement logout functionality
          AppSnackbar.success(
            title: AppStrings.success,
            message: 'تم تسجيل الخروج بنجاح',
          );
        },
      ),
    );
  }

  static void showSpecializationDialog(String currentSpecialization, Function(String) onSelected) {
    final specializations = ProfileData.getSpecializations();
    
    Get.dialog(
      AppDialog(
        title: 'اختر التخصص',
        content: SizedBox(
          width: double.maxFinite,
          height: 300,
          child: ListView.builder(
            itemCount: specializations.length,
            itemBuilder: (context, index) {
              final specialization = specializations[index];
              final isSelected = specialization == currentSpecialization;
              
              return ListTile(
                title: Text(specialization),
                trailing: isSelected ? const Icon(AppIcons.check) : null,
                onTap: () {
                  onSelected(specialization);
                  Get.back();
                },
              );
            },
          ),
        ),
        showCancel: true,
        confirmText: 'إلغاء',
        onConfirm: () => Get.back(),
      ),
    );
  }

  static void showLocationDialog(String currentLocation, Function(String) onSelected) {
    final cities = ProfileData.getCities();
    
    Get.dialog(
      AppDialog(
        title: 'اختر المدينة',
        content: SizedBox(
          width: double.maxFinite,
          height: 300,
          child: ListView.builder(
            itemCount: cities.length,
            itemBuilder: (context, index) {
              final city = cities[index];
              final isSelected = city == currentLocation;
              
              return ListTile(
                title: Text(city),
                trailing: isSelected ? const Icon(AppIcons.check) : null,
                onTap: () {
                  onSelected(city);
                  Get.back();
                },
              );
            },
          ),
        ),
        showCancel: true,
        confirmText: 'إلغاء',
        onConfirm: () => Get.back(),
      ),
    );
  }

  static String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'الاسم مطلوب';
    }
    if (!ProfileData.validateName(value)) {
      return 'الاسم يجب أن يكون بين 2 و 50 حرف';
    }
    return null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'البريد الإلكتروني مطلوب';
    }
    if (!ProfileData.validateEmail(value)) {
      return 'البريد الإلكتروني غير صحيح';
    }
    return null;
  }

  static String? validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return 'رقم الهاتف مطلوب';
    }
    if (!ProfileData.validatePhone(value)) {
      return 'رقم الهاتف غير صحيح (يجب أن يبدأ بـ +966)';
    }
    return null;
  }

  static String? validateBio(String? value) {
    if (value == null || value.isEmpty) {
      return 'النبذة الشخصية مطلوبة';
    }
    if (!ProfileData.validateBio(value)) {
      return 'النبذة الشخصية يجب أن تكون بين 10 و 500 حرف';
    }
    return null;
  }

  static void saveProfile(UserModel user) {
    // TODO: Implement API call to save profile
    AppSnackbar.success(
      title: AppStrings.success,
      message: AppStrings.dataSavedSuccessfully,
    );
  }
}
