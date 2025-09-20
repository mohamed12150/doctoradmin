import 'package:flutter/material.dart';
import 'package:ui_doc/core/widgets/shared/app_button.dart';
import '../../../core/constants/index.dart';

class NotificationHeader extends StatelessWidget {
  final int unreadCount;
  final VoidCallback? onMarkAllRead;

  const NotificationHeader({
    super.key,
    required this.unreadCount,
    this.onMarkAllRead,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSizes.paddingM),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppStrings.notifications,
                  style: AppTextStyles.h4.copyWith(
                    color: AppColors.textPrimary,
                  ),
                ),
                const SizedBox(height: AppSizes.paddingXS),
                Text(
                  unreadCount > 0
                      ? 'لديك $unreadCount إشعار غير مقروء'
                      : 'لا توجد إشعارات جديدة',
                  style: AppTextStyles.bodyMedium.copyWith(
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
          if (unreadCount > 0)
            Flexible(
              child: AppButton(
                text: AppStrings.markAllRead,
                onPressed: onMarkAllRead,
                type: AppButtonType.outline,
                size: AppButtonSize.small,
                icon: AppIcons.markRead,
              ),
            ),
        ],
      ),
    );
  }
}
