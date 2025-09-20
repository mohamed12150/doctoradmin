import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants/index.dart';
import '../../services/translation_service.dart';

class LanguageSwitcher extends StatelessWidget {
  final bool showLabel;
  final bool showFlag;
  final bool showArrow;
  final EdgeInsetsGeometry? padding;
  final Color? backgroundColor;
  final Color? textColor;
  final BorderRadius? borderRadius;

  const LanguageSwitcher({
    super.key,
    this.showLabel = true,
    this.showFlag = true,
    this.showArrow = true,
    this.padding,
    this.backgroundColor,
    this.textColor,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TranslationService>(
      builder: (translationService) {
        return GestureDetector(
          onTap: () => _showLanguageDialog(context),
          child: Container(
            padding:
                padding ??
                const EdgeInsets.symmetric(
                  horizontal: AppSizes.space4,
                  vertical: AppSizes.space2,
                ),
            decoration: BoxDecoration(
              color: backgroundColor ?? AppColors.surfaceContainer,
              borderRadius:
                  borderRadius ?? BorderRadius.circular(AppSizes.radiusM),
              border: Border.all(
                color: AppColors.border.withOpacity(0.2),
                width: 1,
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (showFlag) ...[
                  Text(
                    translationService.getLanguageFlag(
                      translationService.currentLanguage,
                    ),
                    style: const TextStyle(fontSize: 20),
                  ),
                  const SizedBox(width: AppSizes.space2),
                ],
                if (showLabel) ...[
                  Text(
                    translationService.getLanguageName(
                      translationService.currentLanguage,
                    ),
                    style: AppTextStyles.bodyMedium.copyWith(
                      color: textColor ?? AppColors.textPrimary,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(width: AppSizes.space2),
                ],
                if (showArrow) ...[
                  Icon(
                    Icons.keyboard_arrow_down,
                    color: textColor ?? AppColors.textSecondary,
                    size: AppSizes.iconS,
                  ),
                ],
              ],
            ),
          ),
        );
      },
    );
  }

  void _showLanguageDialog(BuildContext context) {
    showDialog(context: context, builder: (context) => LanguageDialog());
  }
}

class LanguageDialog extends StatelessWidget {
  const LanguageDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TranslationService>(
      builder: (translationService) {
        return AlertDialog(
          title: Text(
            AppStrings.selectLanguage,
            style: AppTextStyles.h6.copyWith(color: AppColors.textPrimary),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: translationService.getSupportedLanguages().map((
              language,
            ) {
              final isSelected =
                  language['code'] == translationService.currentLanguage;

              return Container(
                margin: const EdgeInsets.only(bottom: AppSizes.space2),
                child: ListTile(
                  leading: Text(
                    language['flag']!,
                    style: const TextStyle(fontSize: 24),
                  ),
                  title: Text(
                    language['name']!,
                    style: AppTextStyles.bodyLarge.copyWith(
                      color: isSelected
                          ? AppColors.primary
                          : AppColors.textPrimary,
                      fontWeight: isSelected
                          ? FontWeight.w600
                          : FontWeight.normal,
                    ),
                  ),
                  trailing: isSelected
                      ? Icon(
                          Icons.check_circle,
                          color: AppColors.primary,
                          size: AppSizes.iconM,
                        )
                      : null,
                  onTap: () async {
                    await translationService.changeLanguage(language['code']!);
                    Navigator.of(context).pop();
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppSizes.radiusM),
                  ),
                  tileColor: isSelected
                      ? AppColors.primary.withOpacity(0.1)
                      : Colors.transparent,
                ),
              );
            }).toList(),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(
                AppStrings.cancel,
                style: AppTextStyles.bodyMedium.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

class LanguageSwitcherButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final EdgeInsetsGeometry? padding;
  final Color? backgroundColor;
  final Color? textColor;
  final BorderRadius? borderRadius;

  const LanguageSwitcherButton({
    super.key,
    this.onPressed,
    this.padding,
    this.backgroundColor,
    this.textColor,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TranslationService>(
      builder: (translationService) {
        return ElevatedButton.icon(
          onPressed: onPressed ?? () => _showLanguageDialog(context),
          icon: Text(
            translationService.getLanguageFlag(
              translationService.currentLanguage,
            ),
            style: const TextStyle(fontSize: 16),
          ),
          label: Text(
            translationService.getLanguageName(
              translationService.currentLanguage,
            ),
          ),
          style: ElevatedButton.styleFrom(
            padding:
                padding ??
                const EdgeInsets.symmetric(
                  horizontal: AppSizes.space6,
                  vertical: AppSizes.space3,
                ),
            backgroundColor: backgroundColor ?? AppColors.surfaceContainer,
            foregroundColor: textColor ?? AppColors.textPrimary,
            shape: RoundedRectangleBorder(
              borderRadius:
                  borderRadius ?? BorderRadius.circular(AppSizes.radiusM),
            ),
          ),
        );
      },
    );
  }

  void _showLanguageDialog(BuildContext context) {
    showDialog(context: context, builder: (context) => const LanguageDialog());
  }
}

class LanguageSwitcherChip extends StatelessWidget {
  final bool showFlag;
  final EdgeInsetsGeometry? padding;
  final Color? backgroundColor;
  final Color? textColor;
  final BorderRadius? borderRadius;

  const LanguageSwitcherChip({
    super.key,
    this.showFlag = true,
    this.padding,
    this.backgroundColor,
    this.textColor,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TranslationService>(
      builder: (translationService) {
        return GestureDetector(
          onTap: () => _showLanguageDialog(context),
          child: Container(
            padding:
                padding ??
                const EdgeInsets.symmetric(
                  horizontal: AppSizes.space4,
                  vertical: AppSizes.space2,
                ),
            decoration: BoxDecoration(
              color: backgroundColor ?? AppColors.primary.withOpacity(0.1),
              borderRadius:
                  borderRadius ?? BorderRadius.circular(AppSizes.radiusFull),
              border: Border.all(
                color: AppColors.primary.withOpacity(0.3),
                width: 1,
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (showFlag) ...[
                  Text(
                    translationService.getLanguageFlag(
                      translationService.currentLanguage,
                    ),
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(width: AppSizes.space2),
                ],
                Text(
                  translationService.getLanguageName(
                    translationService.currentLanguage,
                  ),
                  style: AppTextStyles.caption.copyWith(
                    color: textColor ?? AppColors.primary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showLanguageDialog(BuildContext context) {
    showDialog(context: context, builder: (context) => const LanguageDialog());
  }
}
