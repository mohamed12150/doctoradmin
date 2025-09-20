import 'package:flutter/material.dart';
import '../../constants/index.dart';

class AppTextField extends StatelessWidget {
  final String? label;
  final String? hint;
  final String? helperText;
  final String? errorText;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final bool obscureText;
  final bool enabled;
  final bool readOnly;
  final int? maxLines;
  final int? maxLength;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final Widget? prefix;
  final Widget? suffix;
  final VoidCallback? onTap;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final VoidCallback? onSuffixTap;
  final String? Function(String?)? validator;
  final EdgeInsets? contentPadding;
  final Color? fillColor;
  final bool filled;
  final BorderRadius? borderRadius;
  final InputBorder? border;
  final InputBorder? enabledBorder;
  final InputBorder? focusedBorder;
  final InputBorder? errorBorder;
  final InputBorder? focusedErrorBorder;

  const AppTextField({
    super.key,
    this.label,
    this.hint,
    this.helperText,
    this.errorText,
    this.controller,
    this.keyboardType,
    this.obscureText = false,
    this.enabled = true,
    this.readOnly = false,
    this.maxLines = 1,
    this.maxLength,
    this.prefixIcon,
    this.suffixIcon,
    this.prefix,
    this.suffix,
    this.onTap,
    this.onChanged,
    this.onSubmitted,
    this.onSuffixTap,
    this.validator,
    this.contentPadding,
    this.fillColor,
    this.filled = false,
    this.borderRadius,
    this.border,
    this.enabledBorder,
    this.focusedBorder,
    this.errorBorder,
    this.focusedErrorBorder,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      enabled: enabled,
      readOnly: readOnly,
      maxLines: maxLines,
      maxLength: maxLength,
      onTap: onTap,
      onChanged: onChanged,
      onFieldSubmitted: onSubmitted,
      validator: validator,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        helperText: helperText,
        errorText: errorText,
        prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
        suffixIcon: _buildSuffixIcon(),
        prefix: prefix,
        suffix: suffix,
        contentPadding:
            contentPadding ??
            const EdgeInsets.symmetric(
              horizontal: AppSizes.paddingM,
              vertical: AppSizes.paddingM,
            ),
        filled: filled,
        fillColor: fillColor ?? AppColors.surface,
        border: border ?? _getDefaultBorder(),
        enabledBorder: enabledBorder ?? _getDefaultBorder(),
        focusedBorder: focusedBorder ?? _getFocusedBorder(),
        errorBorder: errorBorder ?? _getErrorBorder(),
        focusedErrorBorder: focusedErrorBorder ?? _getFocusedErrorBorder(),
      ),
    );
  }

  Widget? _buildSuffixIcon() {
    if (suffixIcon != null) {
      return GestureDetector(onTap: onSuffixTap, child: Icon(suffixIcon));
    }
    return null;
  }

  InputBorder _getDefaultBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(
        borderRadius is num
            ? (borderRadius as num).toDouble()
            : AppSizes.radiusM,
      ),
      borderSide: const BorderSide(color: AppColors.border),
    );
  }

  InputBorder _getFocusedBorder() {
    return OutlineInputBorder(
      borderRadius: borderRadius ?? BorderRadius.circular(AppSizes.radiusM),
      borderSide: const BorderSide(color: AppColors.primary, width: 2),
    );
  }

  InputBorder _getErrorBorder() {
    return OutlineInputBorder(
      borderRadius: borderRadius ?? BorderRadius.circular(AppSizes.radiusM),
      borderSide: const BorderSide(color: AppColors.error),
    );
  }

  InputBorder _getFocusedErrorBorder() {
    return OutlineInputBorder(
      borderRadius: borderRadius ?? BorderRadius.circular(AppSizes.radiusM),
      borderSide: const BorderSide(color: AppColors.error, width: 2),
    );
  }
}
