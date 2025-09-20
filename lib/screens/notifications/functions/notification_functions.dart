import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constants/index.dart';
import '../../../core/widgets/index.dart';
import '../../../core/models/index.dart';

class NotificationFunctions {
  static void markAsRead(String notificationId) {
    // TODO: Implement API call to mark notification as read
    AppSnackbar.success(
      title: AppStrings.success,
      message: AppStrings.notificationMarkedAsRead,
    );
  }

  static void markAllAsRead() {
    // TODO: Implement API call to mark all notifications as read
    AppSnackbar.success(
      title: AppStrings.success,
      message: AppStrings.allNotificationsMarkedAsRead,
    );
  }

  static void showNotificationDetails(NotificationModel notification) {
    Get.dialog(
      AppDialog(
        title: notification.title,
        description: notification.message,
        confirmText: AppStrings.ok,
        onConfirm: () => Get.back(),
        icon: _getTypeIcon(notification.type),
        iconColor: _getTypeColor(notification.type),
      ),
    );
  }

  static void showDeleteNotificationDialog(String notificationId) {
    Get.dialog(
      AppConfirmDialog(
        title: 'حذف الإشعار',
        description: 'هل أنت متأكد من أنك تريد حذف هذا الإشعار؟',
        confirmText: 'حذف',
        cancelText: 'إلغاء',
        isDestructive: true,
        onConfirm: () {
          Get.back();
          // TODO: Implement delete notification functionality
          AppSnackbar.success(
            title: AppStrings.success,
            message: 'تم حذف الإشعار بنجاح',
          );
        },
      ),
    );
  }

  static void showClearAllNotificationsDialog() {
    Get.dialog(
      AppConfirmDialog(
        title: 'مسح جميع الإشعارات',
        description: 'هل أنت متأكد من أنك تريد مسح جميع الإشعارات؟',
        confirmText: 'مسح الكل',
        cancelText: 'إلغاء',
        isDestructive: true,
        onConfirm: () {
          Get.back();
          // TODO: Implement clear all notifications functionality
          AppSnackbar.success(
            title: AppStrings.success,
            message: 'تم مسح جميع الإشعارات بنجاح',
          );
        },
      ),
    );
  }

  static void handleNotificationTap(NotificationModel notification) {
    if (notification.data != null) {
      // Handle specific notification types
      switch (notification.type) {
        case NotificationType.appointment:
          _handleAppointmentNotification(notification);
          break;
        case NotificationType.reminder:
          _handleReminderNotification(notification);
          break;
        case NotificationType.system:
          _handleSystemNotification(notification);
          break;
        case NotificationType.update:
          _handleUpdateNotification(notification);
          break;
        case NotificationType.alert:
          _handleAlertNotification(notification);
          break;
      }
    } else {
      showNotificationDetails(notification);
    }
  }

  static void _handleAppointmentNotification(NotificationModel notification) {
    final appointmentId = notification.data?['appointmentId'];
    if (appointmentId != null) {
      // Navigate to appointment details
      Get.toNamed('/appointments');
    } else {
      showNotificationDetails(notification);
    }
  }

  static void _handleReminderNotification(NotificationModel notification) {
    final appointmentId = notification.data?['appointmentId'];
    if (appointmentId != null) {
      // Navigate to appointment details
      Get.toNamed('/appointments');
    } else {
      showNotificationDetails(notification);
    }
  }

  static void _handleSystemNotification(NotificationModel notification) {
    showNotificationDetails(notification);
  }

  static void _handleUpdateNotification(NotificationModel notification) {
    showNotificationDetails(notification);
  }

  static void _handleAlertNotification(NotificationModel notification) {
    showNotificationDetails(notification);
  }

  static IconData _getTypeIcon(NotificationType type) {
    switch (type) {
      case NotificationType.appointment:
        return AppIcons.appointments;
      case NotificationType.reminder:
        return AppIcons.time;
      case NotificationType.system:
        return AppIcons.settings;
      case NotificationType.update:
        return AppIcons.info;
      case NotificationType.alert:
        return AppIcons.warning;
    }
  }

  static Color _getTypeColor(NotificationType type) {
    switch (type) {
      case NotificationType.appointment:
        return AppColors.primary;
      case NotificationType.reminder:
        return AppColors.warning;
      case NotificationType.system:
        return AppColors.info;
      case NotificationType.update:
        return AppColors.success;
      case NotificationType.alert:
        return AppColors.error;
    }
  }
}
