import '../../../core/models/index.dart';

class NotificationData {
  static List<NotificationModel> getMockNotifications() {
    return [
      NotificationModel(
        id: '1',
        title: 'موعد جديد',
        message: 'لديك موعد جديد مع المريض أحمد محمد في الساعة 2:00 مساءً',
        type: NotificationType.appointment,
        priority: NotificationPriority.high,
        isRead: false,
        createdAt: DateTime.now().subtract(const Duration(minutes: 30)),
        data: {'appointmentId': '1', 'patientName': 'أحمد محمد'},
      ),
      NotificationModel(
        id: '2',
        title: 'تذكير بالموعد',
        message: 'موعدك مع المريض فاطمة علي خلال 30 دقيقة',
        type: NotificationType.reminder,
        priority: NotificationPriority.medium,
        isRead: false,
        createdAt: DateTime.now().subtract(const Duration(hours: 1)),
        data: {'appointmentId': '2', 'patientName': 'فاطمة علي'},
      ),
      NotificationModel(
        id: '3',
        title: 'تحديث النظام',
        message: 'تم تحديث النظام بنجاح. يمكنك الآن الاستفادة من الميزات الجديدة',
        type: NotificationType.system,
        priority: NotificationPriority.low,
        isRead: true,
        createdAt: DateTime.now().subtract(const Duration(days: 1)),
        readAt: DateTime.now().subtract(const Duration(hours: 12)),
      ),
      NotificationModel(
        id: '4',
        title: 'موعد ملغي',
        message: 'تم إلغاء موعدك مع المريض محمد عبدالله',
        type: NotificationType.appointment,
        priority: NotificationPriority.medium,
        isRead: true,
        createdAt: DateTime.now().subtract(const Duration(days: 2)),
        readAt: DateTime.now().subtract(const Duration(days: 1)),
        data: {'appointmentId': '3', 'patientName': 'محمد عبدالله'},
      ),
      NotificationModel(
        id: '5',
        title: 'تنبيه مهم',
        message: 'يرجى تحديث معلوماتك الشخصية لضمان استمرار الخدمة',
        type: NotificationType.alert,
        priority: NotificationPriority.urgent,
        isRead: false,
        createdAt: DateTime.now().subtract(const Duration(days: 3)),
      ),
      NotificationModel(
        id: '6',
        title: 'موعد مكتمل',
        message: 'تم إكمال موعدك مع المريض نورا سالم بنجاح',
        type: NotificationType.appointment,
        priority: NotificationPriority.low,
        isRead: true,
        createdAt: DateTime.now().subtract(const Duration(days: 4)),
        readAt: DateTime.now().subtract(const Duration(days: 3)),
        data: {'appointmentId': '4', 'patientName': 'نورا سالم'},
      ),
    ];
  }

  static List<NotificationModel> filterNotifications(
    List<NotificationModel> notifications,
    String filter,
  ) {
    if (filter == 'All') return notifications;
    
    final type = NotificationType.values.firstWhere(
      (e) => e.name.toLowerCase() == filter.toLowerCase(),
      orElse: () => NotificationType.system,
    );
    
    return notifications.where((notification) => notification.type == type).toList();
  }

  static List<NotificationModel> searchNotifications(
    List<NotificationModel> notifications,
    String query,
  ) {
    if (query.isEmpty) return notifications;
    
    final lowercaseQuery = query.toLowerCase();
    return notifications.where((notification) {
      return notification.title.toLowerCase().contains(lowercaseQuery) ||
             notification.message.toLowerCase().contains(lowercaseQuery);
    }).toList();
  }

  static int getUnreadCount(List<NotificationModel> notifications) {
    return notifications.where((notification) => !notification.isRead).length;
  }

  static List<String> getFilterOptions() {
    return [
      'All',
      'Appointment',
      'Reminder',
      'System',
      'Update',
      'Alert',
    ];
  }
}
