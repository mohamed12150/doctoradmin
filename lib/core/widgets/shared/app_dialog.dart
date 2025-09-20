import 'package:flutter/material.dart';
import '../../constants/index.dart';
import 'app_button.dart';
import 'app_loading.dart';

class AppDialog extends StatelessWidget {
  final String title;
  final String? description;
  final Widget? content;
  final String? confirmText;
  final String? cancelText;
  final VoidCallback? onConfirm;
  final VoidCallback? onCancel;
  final bool showCancel;
  final bool isDestructive;
  final IconData? icon;
  final Color? iconColor;

  const AppDialog({
    super.key,
    required this.title,
    this.description,
    this.content,
    this.confirmText,
    this.cancelText,
    this.onConfirm,
    this.onCancel,
    this.showCancel = true,
    this.isDestructive = false,
    this.icon,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Row(
        children: [
          if (icon != null) ...[
            Icon(
              icon,
              color:
                  iconColor ??
                  (isDestructive ? AppColors.error : AppColors.primary),
              size: AppSizes.iconL,
            ),
            const SizedBox(width: AppSizes.paddingS),
          ],
          Expanded(child: Text(title, style: AppTextStyles.h6)),
        ],
      ),
      content: content ?? (description != null ? Text(description!) : null),
      actions: [
        if (showCancel)
          TextButton(
            onPressed: onCancel ?? () => Navigator.of(context).pop(),
            child: Text(
              cancelText ?? AppStrings.cancel,
              style: AppTextStyles.buttonMedium.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
          ),
        AppButton(
          text: confirmText ?? AppStrings.confirm,
          onPressed: onConfirm ?? () => Navigator.of(context).pop(),
          type: isDestructive ? AppButtonType.outline : AppButtonType.primary,
          size: AppButtonSize.medium,
        ),
      ],
    );
  }
}

class AppConfirmDialog extends StatelessWidget {
  final String title;
  final String? description;
  final String? confirmText;
  final String? cancelText;
  final VoidCallback? onConfirm;
  final VoidCallback? onCancel;
  final bool isDestructive;

  const AppConfirmDialog({
    super.key,
    required this.title,
    this.description,
    this.confirmText,
    this.cancelText,
    this.onConfirm,
    this.onCancel,
    this.isDestructive = false,
  });

  @override
  Widget build(BuildContext context) {
    return AppDialog(
      title: title,
      description: description,
      confirmText: confirmText,
      cancelText: cancelText,
      onConfirm: onConfirm,
      onCancel: onCancel,
      isDestructive: isDestructive,
      icon: isDestructive ? AppIcons.warning : AppIcons.help,
      iconColor: isDestructive ? AppColors.warning : AppColors.info,
    );
  }
}

class AppLoadingDialog extends StatelessWidget {
  final String title;
  final String? description;

  const AppLoadingDialog({super.key, required this.title, this.description});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const AppLoading(),
          if (description != null) ...[
            const SizedBox(height: AppSizes.paddingM),
            Text(
              description!,
              style: AppTextStyles.bodyMedium,
              textAlign: TextAlign.center,
            ),
          ],
        ],
      ),
    );
  }
}

class AppInfoDialog extends StatelessWidget {
  final String title;
  final String? description;
  final String? buttonText;
  final VoidCallback? onButtonPressed;

  const AppInfoDialog({
    super.key,
    required this.title,
    this.description,
    this.buttonText,
    this.onButtonPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AppDialog(
      title: title,
      description: description,
      confirmText: buttonText ?? AppStrings.ok,
      onConfirm: onButtonPressed ?? () => Navigator.of(context).pop(),
      showCancel: false,
      icon: AppIcons.info,
      iconColor: AppColors.info,
    );
  }
}

class AppErrorDialog extends StatelessWidget {
  final String title;
  final String? description;
  final String? buttonText;
  final VoidCallback? onButtonPressed;

  const AppErrorDialog({
    super.key,
    required this.title,
    this.description,
    this.buttonText,
    this.onButtonPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AppDialog(
      title: title,
      description: description,
      confirmText: buttonText ?? AppStrings.ok,
      onConfirm: onButtonPressed ?? () => Navigator.of(context).pop(),
      showCancel: false,
      isDestructive: true,
      icon: AppIcons.error,
      iconColor: AppColors.error,
    );
  }
}
