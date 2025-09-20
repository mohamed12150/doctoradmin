import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants/index.dart';

class AppSnackbar {
  static void show({
    required String title,
    String? message,
    SnackPosition position = SnackPosition.BOTTOM,
    Duration duration = const Duration(seconds: 3),
    Color? backgroundColor,
    Color? textColor,
    IconData? icon,
    VoidCallback? onTap,
    bool isDismissible = true,
  }) {
    Get.snackbar(
      title,
      message ?? '',
      snackPosition: position,
      duration: duration,
      backgroundColor: backgroundColor ?? AppColors.surface,
      colorText: textColor ?? AppColors.textPrimary,
      icon: icon != null
          ? Icon(icon, color: textColor ?? AppColors.textPrimary)
          : null,
      onTap: onTap != null ? (_) => onTap() : null,
      isDismissible: isDismissible,
      margin: const EdgeInsets.all(AppSizes.paddingM),
      borderRadius: AppSizes.radiusM,
      boxShadows: [
        BoxShadow(
          color: AppColors.textPrimary.withOpacity(0.2),
          blurRadius: 8,
          offset: const Offset(0, 2),
        ),
      ],
    );
  }

  static void success({
    required String title,
    String? message,
    SnackPosition position = SnackPosition.BOTTOM,
    Duration duration = const Duration(seconds: 3),
    VoidCallback? onTap,
  }) {
    show(
      title: title,
      message: message,
      position: position,
      duration: duration,
      backgroundColor: AppColors.success,
      textColor: AppColors.textOnPrimary,
      icon: AppIcons.success,
      onTap: onTap,
    );
  }

  static void error({
    required String title,
    String? message,
    SnackPosition position = SnackPosition.BOTTOM,
    Duration duration = const Duration(seconds: 4),
    VoidCallback? onTap,
  }) {
    show(
      title: title,
      message: message,
      position: position,
      duration: duration,
      backgroundColor: AppColors.error,
      textColor: AppColors.textOnPrimary,
      icon: AppIcons.error,
      onTap: onTap,
    );
  }

  static void warning({
    required String title,
    String? message,
    SnackPosition position = SnackPosition.BOTTOM,
    Duration duration = const Duration(seconds: 3),
    VoidCallback? onTap,
  }) {
    show(
      title: title,
      message: message,
      position: position,
      duration: duration,
      backgroundColor: AppColors.warning,
      textColor: AppColors.textOnPrimary,
      icon: AppIcons.warning,
      onTap: onTap,
    );
  }

  static void info({
    required String title,
    String? message,
    SnackPosition position = SnackPosition.BOTTOM,
    Duration duration = const Duration(seconds: 3),
    VoidCallback? onTap,
  }) {
    show(
      title: title,
      message: message,
      position: position,
      duration: duration,
      backgroundColor: AppColors.info,
      textColor: AppColors.textOnPrimary,
      icon: AppIcons.info,
      onTap: onTap,
    );
  }

  static void loading({
    required String title,
    String? message,
    SnackPosition position = SnackPosition.BOTTOM,
    Duration duration = const Duration(seconds: 2),
  }) {
    show(
      title: title,
      message: message,
      position: position,
      duration: duration,
      backgroundColor: AppColors.primary,
      textColor: AppColors.textOnPrimary,
      icon: AppIcons.loading,
      isDismissible: false,
    );
  }
}
