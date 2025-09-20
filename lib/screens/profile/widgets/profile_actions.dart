import 'package:flutter/material.dart';
import '../../../core/constants/index.dart';
import '../../../core/widgets/index.dart';

class ProfileActions extends StatelessWidget {
  final bool isEditMode;
  final VoidCallback? onEdit;
  final VoidCallback? onSave;
  final VoidCallback? onCancel;
  final VoidCallback? onLogout;

  const ProfileActions({
    super.key,
    required this.isEditMode,
    this.onEdit,
    this.onSave,
    this.onCancel,
    this.onLogout,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (isEditMode) ...[
          // Save and Cancel buttons
          Row(
            children: [
              Expanded(
                child: AppButton(
                  text: AppStrings.save,
                  onPressed: onSave,
                  type: AppButtonType.primary,
                  size: AppButtonSize.large,
                  icon: AppIcons.save,
                ),
              ),
              const SizedBox(width: AppSizes.paddingM),
              Expanded(
                child: AppButton(
                  text: AppStrings.cancel,
                  onPressed: onCancel,
                  type: AppButtonType.outline,
                  size: AppButtonSize.large,
                  icon: AppIcons.cancel,
                ),
              ),
            ],
          ),
        ] else ...[
          // Edit button
          AppButton(
            text: AppStrings.editProfile,
            onPressed: onEdit,
            type: AppButtonType.primary,
            size: AppButtonSize.large,
            icon: AppIcons.edit,
            isFullWidth: true,
          ),
        ],

        const SizedBox(height: AppSizes.paddingL),

        // Logout button
        AppButton(
          text: 'تسجيل الخروج',
          onPressed: onLogout,
          type: AppButtonType.outline,
          size: AppButtonSize.large,
          icon: AppIcons.logout,
          isFullWidth: true,
          backgroundColor: AppColors.error,
          textColor: AppColors.error,
          borderColor: AppColors.error,
        ),
      ],
    );
  }
}
