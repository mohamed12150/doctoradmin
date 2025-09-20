import 'package:flutter/material.dart';
import '../../../core/constants/index.dart';
import '../../../core/widgets/index.dart';

class EditableField extends StatelessWidget {
  final String label;
  final String value;
  final String? hint;
  final bool isEditable;
  final TextInputType? keyboardType;
  final int? maxLines;
  final String? Function(String?)? validator;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onTap;
  final IconData? icon;
  final Widget? suffix;

  const EditableField({
    super.key,
    required this.label,
    required this.value,
    this.hint,
    this.isEditable = false,
    this.keyboardType,
    this.maxLines = 1,
    this.validator,
    this.onChanged,
    this.onTap,
    this.icon,
    this.suffix,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppTextStyles.bodyMedium.copyWith(
            fontWeight: FontWeight.w600,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: AppSizes.paddingS),

        if (isEditable)
          AppTextField(
            controller: TextEditingController(text: value),
            hint: hint ?? label,
            keyboardType: keyboardType,
            maxLines: maxLines,
            validator: validator,
            onChanged: onChanged,
            prefixIcon: icon,
            suffix: suffix,
            filled: true,
            fillColor: AppColors.surface,
            borderRadius: BorderRadius.circular(AppSizes.radiusM.toDouble()),
          )
        else
          GestureDetector(
            onTap: onTap,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(AppSizes.paddingM),
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(
                  AppSizes.radiusM.toDouble(),
                ),
                border: Border.all(color: AppColors.border),
              ),
              child: Row(
                children: [
                  if (icon != null) ...[
                    Icon(
                      icon,
                      size: AppSizes.iconM,
                      color: AppColors.textSecondary,
                    ),
                    const SizedBox(width: AppSizes.paddingS),
                  ],
                  Expanded(
                    child: Text(
                      value.isEmpty ? hint ?? label : value,
                      style: AppTextStyles.bodyMedium.copyWith(
                        color: value.isEmpty
                            ? AppColors.textHint
                            : AppColors.textPrimary,
                      ),
                    ),
                  ),
                  if (onTap != null)
                    Icon(
                      AppIcons.edit,
                      size: AppSizes.iconS,
                      color: AppColors.textSecondary,
                    ),
                ],
              ),
            ),
          ),
      ],
    );
  }
}
