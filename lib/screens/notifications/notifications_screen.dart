import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/notification_controller.dart';
import '../../screens/dashboard/widgets/bottom_nav.dart';
import 'widgets/index.dart';
import 'functions/notification_functions.dart';
import '../../core/constants/index.dart';
import '../../core/widgets/index.dart';
import '../../core/widgets/animations.dart';
import '../../core/widgets/shared/language_switcher.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('الإشعارات'),
        centerTitle: false,
        backgroundColor: AppColors.surfaceContainer,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(AppIcons.back),
          onPressed: () => Get.back(),
        ),
        actions: [
          // Language Switcher
          const Padding(
            padding: EdgeInsets.only(right: AppSizes.space2),
            child: LanguageSwitcherChip(),
          ),

          GetX<NotificationController>(
            builder: (controller) {
              return IconButton(
                icon: Stack(
                  children: [
                    const Icon(AppIcons.settings),
                    if (controller.unreadCount > 0)
                      Positioned(
                        right: 0,
                        top: 0,
                        child: Container(
                          padding: const EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            color: AppColors.error,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          constraints: const BoxConstraints(
                            minWidth: 12,
                            minHeight: 12,
                          ),
                          child: Text(
                            '${controller.unreadCount}',
                            style: AppTextStyles.caption.copyWith(
                              color: AppColors.textOnPrimary,
                              fontSize: 10,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                  ],
                ),
                onPressed: () => _showNotificationSettings(context),
              );
            },
          ),
        ],
      ),
      bottomNavigationBar: const DashboardBottomNav(selectedIndex: 2),
      body: GetX<NotificationController>(
        builder: (controller) {
          return Column(
            children: [
              // Enhanced Header
              _buildEnhancedHeader(controller),

              // Filter Tabs
              _buildFilterTabs(controller),

              // Content
              Expanded(
                child: controller.isLoading
                    ? const Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircularProgressIndicator(),
                            SizedBox(height: AppSizes.space4),
                            Text('جاري تحميل الإشعارات...'),
                          ],
                        ),
                      )
                    : controller.filteredNotifications.isEmpty
                    ? _buildEmptyState()
                    : _buildNotificationsList(controller),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildEnhancedHeader(NotificationController controller) {
    return Container(
      padding: const EdgeInsets.all(AppSizes.space4),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainer,
        boxShadow: AppColors.cardShadow,
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(AppSizes.space3),
                decoration: BoxDecoration(
                  color: AppColors.primary.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(AppSizes.radiusM),
                ),
                child: Icon(
                  AppIcons.notifications,
                  color: AppColors.primary,
                  size: AppSizes.iconL,
                ),
              ),
              const SizedBox(width: AppSizes.space4),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'الإشعارات',
                      style: AppTextStyles.headlineMedium.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '${controller.unreadCount} إشعار غير مقروء',
                      style: AppTextStyles.bodyMedium.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
              if (controller.unreadCount > 0)
                AppButton(
                  text: 'تعيين الكل كمقروء',
                  onPressed: () => NotificationFunctions.markAllAsRead(),
                  type: AppButtonType.outline,
                  size: AppButtonSize.small,
                  icon: AppIcons.check,
                ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFilterTabs(NotificationController controller) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSizes.space4,
        vertical: AppSizes.space2,
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            _buildFilterChip(
              'الكل',
              controller.selectedFilter == 'all',
              () => controller.filterNotifications('all'),
              controller.notifications.length,
            ),
            const SizedBox(width: AppSizes.space2),
            _buildFilterChip(
              'غير مقروء',
              controller.selectedFilter == 'unread',
              () => controller.filterNotifications('unread'),
              controller.unreadCount,
            ),
            const SizedBox(width: AppSizes.space2),
            _buildFilterChip(
              'المواعيد',
              controller.selectedFilter == 'appointments',
              () => controller.filterNotifications('appointments'),
              controller.notifications
                  .where((n) => n.type == 'appointment')
                  .length,
            ),
            const SizedBox(width: AppSizes.space2),
            _buildFilterChip(
              'النظام',
              controller.selectedFilter == 'system',
              () => controller.filterNotifications('system'),
              controller.notifications.where((n) => n.type == 'system').length,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterChip(
    String label,
    bool isSelected,
    VoidCallback onTap,
    int count,
  ) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSizes.space4,
          vertical: AppSizes.space2,
        ),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary : AppColors.surfaceVariant,
          borderRadius: BorderRadius.circular(AppSizes.radiusFull),
          border: Border.all(
            color: isSelected ? AppColors.primary : AppColors.border,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              label,
              style: AppTextStyles.bodyMedium.copyWith(
                color: isSelected
                    ? AppColors.textOnPrimary
                    : AppColors.textPrimary,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
              ),
            ),
            if (count > 0) ...[
              const SizedBox(width: AppSizes.space2),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSizes.space2,
                  vertical: 2,
                ),
                decoration: BoxDecoration(
                  color: isSelected
                      ? AppColors.textOnPrimary.withOpacity(0.2)
                      : AppColors.primary,
                  borderRadius: BorderRadius.circular(AppSizes.radiusS),
                ),
                child: Text(
                  '$count',
                  style: AppTextStyles.caption.copyWith(
                    color: isSelected
                        ? AppColors.textOnPrimary
                        : AppColors.textOnPrimary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(AppSizes.space8),
            decoration: BoxDecoration(
              color: AppColors.primary.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(
              AppIcons.notifications,
              color: AppColors.primary,
              size: AppSizes.iconHuge,
            ),
          ),
          const SizedBox(height: AppSizes.space6),
          Text(
            'لا توجد إشعارات',
            style: AppTextStyles.headlineSmall.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: AppSizes.space2),
          Text(
            'ستظهر الإشعارات الجديدة هنا',
            style: AppTextStyles.bodyMedium.copyWith(
              color: AppColors.textSecondary,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildNotificationsList(NotificationController controller) {
    return ListView.builder(
      padding: const EdgeInsets.all(AppSizes.space4),
      itemCount: controller.filteredNotifications.length,
      itemBuilder: (context, index) {
        final notification = controller.filteredNotifications[index];
        return AppAnimations.fadeInUp(
          duration: Duration(milliseconds: 300 + (index * 100)),
          child: Container(
            margin: const EdgeInsets.only(bottom: AppSizes.space3),
            child: NotificationItem(
              notification: notification,
              onTap: () =>
                  NotificationFunctions.handleNotificationTap(notification),
              onMarkAsRead: () =>
                  NotificationFunctions.markAsRead(notification.id),
            ),
          ),
        );
      },
    );
  }

  void _showNotificationSettings(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.surfaceContainer,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(AppSizes.radiusL),
        ),
      ),
      builder: (context) => Container(
        padding: const EdgeInsets.all(AppSizes.space6),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'إعدادات الإشعارات',
              style: AppTextStyles.titleLarge.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: AppSizes.space6),
            _buildSettingItem(
              'إشعارات المواعيد',
              'تلقي إشعارات حول المواعيد',
              true,
              (value) {},
            ),
            _buildSettingItem(
              'إشعارات النظام',
              'تلقي إشعارات النظام والتحديثات',
              true,
              (value) {},
            ),
            _buildSettingItem(
              'إشعارات البريد الإلكتروني',
              'تلقي إشعارات عبر البريد الإلكتروني',
              false,
              (value) {},
            ),
            const SizedBox(height: AppSizes.space6),
            AppButton(
              text: 'حفظ الإعدادات',
              onPressed: () => Navigator.pop(context),
              type: AppButtonType.primary,
              size: AppButtonSize.large,
              isFullWidth: true,
              icon: AppIcons.save,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingItem(
    String title,
    String subtitle,
    bool value,
    Function(bool) onChanged,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSizes.space2),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppTextStyles.bodyLarge.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  subtitle,
                  style: AppTextStyles.bodySmall.copyWith(
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
          Switch(
            value: value,
            onChanged: onChanged,
            activeColor: AppColors.primary,
          ),
        ],
      ),
    );
  }
}
