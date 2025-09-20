import 'package:get/get.dart';
import '../core/models/index.dart';
import '../widgets/error_handling.dart';
import '../screens/notifications/data/notification_data.dart';

class NotificationController extends GetxController {
  final RxList<NotificationModel> _notifications = <NotificationModel>[].obs;
  final RxList<NotificationModel> _filteredNotifications =
      <NotificationModel>[].obs;
  final RxString _selectedFilter = 'All'.obs;
  final RxInt _unreadCount = 0.obs;
  final RxBool _isLoading = false.obs;

  List<NotificationModel> get notifications => _notifications;
  List<NotificationModel> get filteredNotifications => _filteredNotifications;
  String get selectedFilter => _selectedFilter.value;
  int get unreadCount => _unreadCount.value;
  bool get isLoading => _isLoading.value;
  List<String> get filterOptions => NotificationData.getFilterOptions();

  @override
  void onInit() {
    super.onInit();
    if (_notifications.isEmpty) {
      loadNotifications();
    }
  }

  void loadNotifications() async {
    _isLoading.value = true;

    try {
      // Simulate API delay
      await Future.delayed(const Duration(seconds: 1));

      // Load mock data
      _notifications.value = NotificationData.getMockNotifications();
      _filteredNotifications.value = _notifications;
      _unreadCount.value = NotificationData.getUnreadCount(_notifications);

      ErrorHandling.showSuccessSnackbar(
        title: 'Success',
        message: 'Notifications loaded successfully',
      );
    } catch (e) {
      ErrorHandling.showErrorSnackbar(
        title: 'Error',
        message: 'Error loading notifications: $e',
      );
    } finally {
      _isLoading.value = false;
    }
  }

  void filterNotifications(String filter) {
    _selectedFilter.value = filter;
    _filteredNotifications.value = NotificationData.filterNotifications(
      _notifications,
      filter,
    );
  }

  void markAsRead(String notificationId) {
    try {
      final index = _notifications.indexWhere((n) => n.id == notificationId);
      if (index != -1) {
        _notifications[index] = _notifications[index].copyWith(
          isRead: true,
          readAt: DateTime.now(),
        );
        _unreadCount.value = NotificationData.getUnreadCount(_notifications);
        ErrorHandling.showSuccessSnackbar(
          title: 'Success',
          message: 'Notification marked as read',
        );
      }
    } catch (e) {
      ErrorHandling.showErrorSnackbar(
        title: 'Error',
        message: 'Error marking notification as read: $e',
      );
    }
  }

  void markAllAsRead() {
    try {
      for (int i = 0; i < _notifications.length; i++) {
        if (!_notifications[i].isRead) {
          _notifications[i] = _notifications[i].copyWith(
            isRead: true,
            readAt: DateTime.now(),
          );
        }
      }
      _unreadCount.value = 0;
      ErrorHandling.showSuccessSnackbar(
        title: 'Success',
        message: 'All notifications marked as read',
      );
    } catch (e) {
      ErrorHandling.showErrorSnackbar(
        title: 'Error',
        message: 'Error marking all notifications as read: $e',
      );
    }
  }
}
