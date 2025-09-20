import 'package:flutter/material.dart';
import '../core/constants/index.dart';
import '../core/widgets/index.dart';
import '../core/widgets/shared/language_switcher.dart';

class AvailabilityScreen extends StatefulWidget {
  const AvailabilityScreen({super.key});

  @override
  State<AvailabilityScreen> createState() => _AvailabilityScreenState();
}

class _AvailabilityScreenState extends State<AvailabilityScreen> {
  bool isAlwaysAvailable = false;

  final days = const [
    {'name': 'الاثنين', 'en': 'Monday'},
    {'name': 'الثلاثاء', 'en': 'Tuesday'},
    {'name': 'الأربعاء', 'en': 'Wednesday'},
    {'name': 'الخميس', 'en': 'Thursday'},
    {'name': 'الجمعة', 'en': 'Friday'},
    {'name': 'السبت', 'en': 'Saturday'},
    {'name': 'الأحد', 'en': 'Sunday'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('إدارة التوفر'),
        centerTitle: false,
        backgroundColor: AppColors.surface,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(AppIcons.back),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          // Language Switcher
          const Padding(
            padding: EdgeInsets.only(right: AppSizes.space2),
            child: LanguageSwitcherChip(),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSizes.paddingM),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Card
            AppCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(AppSizes.paddingS),
                        decoration: BoxDecoration(
                          color: AppColors.primary.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(AppSizes.radiusS),
                        ),
                        child: Icon(
                          AppIcons.appointments,
                          color: AppColors.primary,
                          size: AppSizes.iconM,
                        ),
                      ),
                      const SizedBox(width: AppSizes.paddingM),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'إعدادات التوفر',
                              style: AppTextStyles.h6.copyWith(
                                color: AppColors.textPrimary,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'حدد أوقات توفرك لاستقبال المرضى',
                              style: AppTextStyles.bodyMedium.copyWith(
                                color: AppColors.textSecondary,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: AppSizes.paddingL),

                  // Availability Mode Toggle
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.surface,
                      borderRadius: BorderRadius.circular(AppSizes.radiusM),
                      border: Border.all(color: AppColors.border),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () =>
                                setState(() => isAlwaysAvailable = false),
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                vertical: AppSizes.paddingM,
                                horizontal: AppSizes.paddingL,
                              ),
                              decoration: BoxDecoration(
                                color: !isAlwaysAvailable
                                    ? AppColors.primary
                                    : Colors.transparent,
                                borderRadius: BorderRadius.circular(
                                  AppSizes.radiusM,
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    AppIcons.clock,
                                    color: !isAlwaysAvailable
                                        ? AppColors.textOnPrimary
                                        : AppColors.textSecondary,
                                    size: AppSizes.iconS,
                                  ),
                                  const SizedBox(width: AppSizes.paddingS),
                                  Text(
                                    'ساعات محددة',
                                    style: AppTextStyles.bodyMedium.copyWith(
                                      color: !isAlwaysAvailable
                                          ? AppColors.textOnPrimary
                                          : AppColors.textSecondary,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () =>
                                setState(() => isAlwaysAvailable = true),
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                vertical: AppSizes.paddingM,
                                horizontal: AppSizes.paddingL,
                              ),
                              decoration: BoxDecoration(
                                color: isAlwaysAvailable
                                    ? AppColors.primary
                                    : Colors.transparent,
                                borderRadius: BorderRadius.circular(
                                  AppSizes.radiusM,
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    AppIcons.success,
                                    color: isAlwaysAvailable
                                        ? AppColors.textOnPrimary
                                        : AppColors.textSecondary,
                                    size: AppSizes.iconS,
                                  ),
                                  const SizedBox(width: AppSizes.paddingS),
                                  Text(
                                    'متاح دائماً',
                                    style: AppTextStyles.bodyMedium.copyWith(
                                      color: isAlwaysAvailable
                                          ? AppColors.textOnPrimary
                                          : AppColors.textSecondary,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: AppSizes.paddingL),

            // Info Card
            Container(
              padding: const EdgeInsets.all(AppSizes.paddingM),
              decoration: BoxDecoration(
                color: AppColors.info.withOpacity(0.1),
                borderRadius: BorderRadius.circular(AppSizes.radiusM),
                border: Border.all(color: AppColors.info.withOpacity(0.3)),
              ),
              child: Row(
                children: [
                  Icon(
                    AppIcons.info,
                    color: AppColors.info,
                    size: AppSizes.iconM,
                  ),
                  const SizedBox(width: AppSizes.paddingM),
                  Expanded(
                    child: Text(
                      'قم بتعيين أوقات توفرك لبدء استقبال المرضى والاستشارات',
                      style: AppTextStyles.bodyMedium.copyWith(
                        color: AppColors.info,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: AppSizes.paddingL),

            if (!isAlwaysAvailable) ...[
              Text(
                'أوقات التوفر',
                style: AppTextStyles.h6.copyWith(
                  color: AppColors.textPrimary,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: AppSizes.paddingM),
              for (final day in days)
                _DaySwitchTile(dayName: day['name']!, dayKey: day['en']!),
            ],

            const SizedBox(height: AppSizes.paddingXL),

            // Save Button
            AppButton(
              text: 'حفظ الإعدادات',
              onPressed: () {
                // Save availability settings
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: const Text('تم حفظ إعدادات التوفر بنجاح'),
                    backgroundColor: AppColors.success,
                  ),
                );
                Navigator.pop(context);
              },
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
}

class _DaySwitchTile extends StatefulWidget {
  final String dayName;
  final String dayKey;
  const _DaySwitchTile({required this.dayName, required this.dayKey});

  @override
  State<_DaySwitchTile> createState() => _DaySwitchTileState();
}

class _DaySwitchTileState extends State<_DaySwitchTile> {
  bool isAvailable = false;
  String startTime = '09:00';
  String endTime = '17:00';
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: AppSizes.paddingM),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppSizes.radiusM),
        border: Border.all(
          color: isAvailable ? AppColors.primary : AppColors.border,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(AppSizes.paddingM),
            child: Row(
              children: [
                Icon(
                  AppIcons.appointments,
                  color: isAvailable
                      ? AppColors.primary
                      : AppColors.textSecondary,
                  size: AppSizes.iconM,
                ),
                const SizedBox(width: AppSizes.paddingM),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.dayName,
                        style: AppTextStyles.bodyLarge.copyWith(
                          fontWeight: FontWeight.w600,
                          color: AppColors.textPrimary,
                        ),
                      ),
                      if (isAvailable && !isExpanded)
                        Text(
                          '$startTime - $endTime',
                          style: AppTextStyles.bodyMedium.copyWith(
                            color: AppColors.textSecondary,
                          ),
                        ),
                    ],
                  ),
                ),
                Switch(
                  value: isAvailable,
                  onChanged: (value) {
                    setState(() {
                      isAvailable = value;
                      if (value) {
                        isExpanded = true;
                      } else {
                        isExpanded = false;
                      }
                    });
                  },
                  activeColor: AppColors.primary,
                ),
              ],
            ),
          ),
          if (isAvailable && isExpanded) ...[
            Container(
              padding: const EdgeInsets.fromLTRB(
                AppSizes.paddingM,
                0,
                AppSizes.paddingM,
                AppSizes.paddingM,
              ),
              decoration: BoxDecoration(
                color: AppColors.background,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(AppSizes.radiusM),
                  bottomRight: Radius.circular(AppSizes.radiusM),
                ),
              ),
              child: Column(
                children: [
                  const Divider(color: AppColors.border),
                  const SizedBox(height: AppSizes.paddingM),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'من',
                              style: AppTextStyles.bodyMedium.copyWith(
                                fontWeight: FontWeight.w600,
                                color: AppColors.textPrimary,
                              ),
                            ),
                            const SizedBox(height: AppSizes.paddingS),
                            GestureDetector(
                              onTap: _selectStartTime,
                              child: Container(
                                padding: const EdgeInsets.all(
                                  AppSizes.paddingM,
                                ),
                                decoration: BoxDecoration(
                                  color: AppColors.surface,
                                  borderRadius: BorderRadius.circular(
                                    AppSizes.radiusS,
                                  ),
                                  border: Border.all(color: AppColors.border),
                                ),
                                child: Row(
                                  children: [
                                    Icon(
                                      AppIcons.clock,
                                      size: AppSizes.iconS,
                                      color: AppColors.primary,
                                    ),
                                    const SizedBox(width: AppSizes.paddingS),
                                    Text(
                                      startTime,
                                      style: AppTextStyles.bodyLarge.copyWith(
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.textPrimary,
                                      ),
                                    ),
                                    const Spacer(),
                                    Icon(
                                      AppIcons.down,
                                      size: AppSizes.iconS,
                                      color: AppColors.textSecondary,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: AppSizes.paddingM),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'إلى',
                              style: AppTextStyles.bodyMedium.copyWith(
                                fontWeight: FontWeight.w600,
                                color: AppColors.textPrimary,
                              ),
                            ),
                            const SizedBox(height: AppSizes.paddingS),
                            GestureDetector(
                              onTap: _selectEndTime,
                              child: Container(
                                padding: const EdgeInsets.all(
                                  AppSizes.paddingM,
                                ),
                                decoration: BoxDecoration(
                                  color: AppColors.surface,
                                  borderRadius: BorderRadius.circular(
                                    AppSizes.radiusS,
                                  ),
                                  border: Border.all(color: AppColors.border),
                                ),
                                child: Row(
                                  children: [
                                    Icon(
                                      AppIcons.clock,
                                      size: AppSizes.iconS,
                                      color: AppColors.primary,
                                    ),
                                    const SizedBox(width: AppSizes.paddingS),
                                    Text(
                                      endTime,
                                      style: AppTextStyles.bodyLarge.copyWith(
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.textPrimary,
                                      ),
                                    ),
                                    const Spacer(),
                                    Icon(
                                      AppIcons.down,
                                      size: AppSizes.iconS,
                                      color: AppColors.textSecondary,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: AppSizes.paddingM),
                  Row(
                    children: [
                      Expanded(
                        child: AppButton(
                          text: 'تم',
                          onPressed: () {
                            setState(() {
                              isExpanded = false;
                            });
                          },
                          type: AppButtonType.primary,
                          size: AppButtonSize.medium,
                          icon: AppIcons.check,
                        ),
                      ),
                      const SizedBox(width: AppSizes.paddingM),
                      Expanded(
                        child: AppButton(
                          text: 'إزالة',
                          onPressed: () {
                            setState(() {
                              isAvailable = false;
                              isExpanded = false;
                            });
                          },
                          type: AppButtonType.outline,
                          size: AppButtonSize.medium,
                          icon: AppIcons.close,
                          textColor: AppColors.error,
                          borderColor: AppColors.error,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }

  void _selectStartTime() {
    showTimePicker(
      context: context,
      initialTime: TimeOfDay(
        hour: int.parse(startTime.split(':')[0]),
        minute: int.parse(startTime.split(':')[1]),
      ),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: AppColors.primary,
              onPrimary: AppColors.textOnPrimary,
              onSurface: AppColors.textPrimary,
            ),
          ),
          child: child!,
        );
      },
    ).then((time) {
      if (time != null) {
        setState(() {
          startTime =
              '${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}';
        });
      }
    });
  }

  void _selectEndTime() {
    showTimePicker(
      context: context,
      initialTime: TimeOfDay(
        hour: int.parse(endTime.split(':')[0]),
        minute: int.parse(endTime.split(':')[1]),
      ),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: AppColors.primary,
              onPrimary: AppColors.textOnPrimary,
              onSurface: AppColors.textPrimary,
            ),
          ),
          child: child!,
        );
      },
    ).then((time) {
      if (time != null) {
        setState(() {
          endTime =
              '${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}';
        });
      }
    });
  }
}
