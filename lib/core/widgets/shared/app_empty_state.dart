import 'package:flutter/material.dart';
import '../../constants/index.dart';
import 'app_button.dart';

class AppEmptyState extends StatelessWidget {
  final String title;
  final String? description;
  final IconData? icon;
  final String? actionText;
  final VoidCallback? onAction;
  final Widget? customIcon;
  final Color? iconColor;
  final double? iconSize;

  const AppEmptyState({
    super.key,
    required this.title,
    this.description,
    this.icon,
    this.actionText,
    this.onAction,
    this.customIcon,
    this.iconColor,
    this.iconSize,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppSizes.paddingXL),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (customIcon != null)
              customIcon!
            else if (icon != null)
              Icon(
                icon,
                size: iconSize ?? AppSizes.iconXXL,
                color: iconColor ?? AppColors.textSecondary,
              ),
            const SizedBox(height: AppSizes.paddingL),
            Text(
              title,
              style: AppTextStyles.h5.copyWith(
                color: AppColors.textPrimary,
              ),
              textAlign: TextAlign.center,
            ),
            if (description != null) ...[
              const SizedBox(height: AppSizes.paddingS),
              Text(
                description!,
                style: AppTextStyles.bodyMedium.copyWith(
                  color: AppColors.textSecondary,
                ),
                textAlign: TextAlign.center,
              ),
            ],
            if (actionText != null && onAction != null) ...[
              const SizedBox(height: AppSizes.paddingL),
              AppButton(
                text: actionText!,
                onPressed: onAction,
                type: AppButtonType.primary,
                size: AppButtonSize.medium,
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class AppEmptyStateWithIcon extends StatelessWidget {
  final String title;
  final String? description;
  final String iconPath;
  final String? actionText;
  final VoidCallback? onAction;
  final double? iconSize;

  const AppEmptyStateWithIcon({
    super.key,
    required this.title,
    this.description,
    required this.iconPath,
    this.actionText,
    this.onAction,
    this.iconSize,
  });

  @override
  Widget build(BuildContext context) {
    return AppEmptyState(
      title: title,
      description: description,
      customIcon: Image.asset(
        iconPath,
        width: iconSize ?? AppSizes.iconXXL,
        height: iconSize ?? AppSizes.iconXXL,
        color: AppColors.textSecondary,
      ),
      actionText: actionText,
      onAction: onAction,
    );
  }
}
