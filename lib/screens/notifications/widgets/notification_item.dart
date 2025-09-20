import 'package:flutter/material.dart';
import '../../../core/models/index.dart';
import '../../../core/constants/index.dart';

class NotificationItem extends StatelessWidget {
  final NotificationModel notification;
  final VoidCallback? onTap;
  final VoidCallback? onMarkAsRead;

  const NotificationItem({
    super.key,
    required this.notification,
    this.onTap,
    this.onMarkAsRead,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: AppSizes.space3),
      decoration: BoxDecoration(
        color: notification.isRead
            ? AppColors.surfaceContainer
            : AppColors.primary.withOpacity(0.02),
        borderRadius: BorderRadius.circular(AppSizes.radiusL),
        border: Border.all(
          color: notification.isRead
              ? AppColors.borderLight
              : AppColors.primary.withOpacity(0.1),
          width: notification.isRead ? 1 : 1.5,
        ),
        boxShadow: notification.isRead
            ? AppColors.cardShadow
            : [
                BoxShadow(
                  color: AppColors.primary.withOpacity(0.1),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(AppSizes.radiusL),
          child: Padding(
            padding: const EdgeInsets.all(AppSizes.space4),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Icon with status indicator
                Stack(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(AppSizes.space3),
                      decoration: BoxDecoration(
                        color: _getTypeColor().withOpacity(0.1),
                        borderRadius: BorderRadius.circular(AppSizes.radiusM),
                        border: Border.all(
                          color: _getTypeColor().withOpacity(0.2),
                        ),
                      ),
                      child: Icon(
                        _getTypeIcon(),
                        color: _getTypeColor(),
                        size: AppSizes.iconM,
                      ),
                    ),
                    if (!notification.isRead)
                      Positioned(
                        right: -2,
                        top: -2,
                        child: Container(
                          width: 12,
                          height: 12,
                          decoration: BoxDecoration(
                            color: AppColors.primary,
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: AppColors.surfaceContainer,
                              width: 2,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),

                const SizedBox(width: AppSizes.space4),

                // Content
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Title and priority
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              notification.title,
                              style: AppTextStyles.titleMedium.copyWith(
                                fontWeight: notification.isRead
                                    ? FontWeight.w500
                                    : FontWeight.w700,
                                color: AppColors.textPrimary,
                              ),
                            ),
                          ),
                          if (notification.priority ==
                              NotificationPriority.urgent)
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: AppSizes.space2,
                                vertical: AppSizes.space1,
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.error.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(
                                  AppSizes.radiusS,
                                ),
                                border: Border.all(
                                  color: AppColors.error.withOpacity(0.3),
                                ),
                              ),
                              child: Text(
                                'عاجل',
                                style: AppTextStyles.caption.copyWith(
                                  color: AppColors.error,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                        ],
                      ),

                      const SizedBox(height: AppSizes.space2),

                      // Message
                      Text(
                        notification.message,
                        style: AppTextStyles.bodyMedium.copyWith(
                          color: AppColors.textSecondary,
                          height: 1.4,
                        ),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),

                      const SizedBox(height: AppSizes.space3),

                      // Time and actions
                      Row(
                        children: [
                          Icon(
                            AppIcons.time,
                            size: AppSizes.iconS,
                            color: AppColors.textTertiary,
                          ),
                          const SizedBox(width: AppSizes.space1),
                          Text(
                            _formatTime(notification.createdAt),
                            style: AppTextStyles.caption.copyWith(
                              color: AppColors.textTertiary,
                            ),
                          ),
                          const Spacer(),
                          if (!notification.isRead)
                            GestureDetector(
                              onTap: onMarkAsRead,
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: AppSizes.space2,
                                  vertical: AppSizes.space1,
                                ),
                                decoration: BoxDecoration(
                                  color: AppColors.primary.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(
                                    AppSizes.radiusS,
                                  ),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(
                                      AppIcons.check,
                                      size: AppSizes.iconXS,
                                      color: AppColors.primary,
                                    ),
                                    const SizedBox(width: AppSizes.space1),
                                    Text(
                                      'تعيين كمقروء',
                                      style: AppTextStyles.caption.copyWith(
                                        color: AppColors.primary,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Color _getTypeColor() {
    switch (notification.type) {
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

  IconData _getTypeIcon() {
    switch (notification.type) {
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

  String _formatTime(DateTime dateTime) {
    final now = DateTime.now();
    final difference = now.difference(dateTime);

    if (difference.inMinutes < 1) {
      return 'الآن';
    } else if (difference.inMinutes < 60) {
      return 'منذ ${difference.inMinutes} دقيقة';
    } else if (difference.inHours < 24) {
      return 'منذ ${difference.inHours} ساعة';
    } else if (difference.inDays < 7) {
      return 'منذ ${difference.inDays} يوم';
    } else {
      return '${dateTime.day}/${dateTime.month}/${dateTime.year}';
    }
  }
}
