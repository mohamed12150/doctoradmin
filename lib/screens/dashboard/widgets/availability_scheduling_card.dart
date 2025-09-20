import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constants/index.dart';

class AvailabilitySchedulingCard extends StatelessWidget {
  const AvailabilitySchedulingCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.primary.withOpacity(0.1),
            AppColors.secondary.withOpacity(0.1),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(AppSizes.radiusL),
        border: Border.all(color: AppColors.primary.withOpacity(0.2)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppSizes.paddingM),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(AppSizes.paddingXS),
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(AppSizes.radiusS),
                  ),
                  child: const Icon(
                    AppIcons.appointments,
                    color: AppColors.textOnPrimary,
                    size: AppSizes.iconS,
                  ),
                ),
                const SizedBox(width: AppSizes.paddingS),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'التوفر وجدولة المواعيد',
                        style: AppTextStyles.bodyLarge.copyWith(
                          color: AppColors.textPrimary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'إدارة توفرك ومواعيدك بسهولة',
                        style: AppTextStyles.bodySmall.copyWith(
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: AppSizes.paddingM),

            // Availability Status
            Container(
              padding: const EdgeInsets.all(AppSizes.paddingS),
              decoration: BoxDecoration(
                color: AppColors.success.withOpacity(0.1),
                borderRadius: BorderRadius.circular(AppSizes.radiusM),
                border: Border.all(color: AppColors.success.withOpacity(0.3)),
              ),
              child: Row(
                children: [
                  Icon(
                    AppIcons.success,
                    color: AppColors.success,
                    size: AppSizes.iconS,
                  ),
                  const SizedBox(width: AppSizes.paddingS),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'متاح للاستشارات',
                          style: AppTextStyles.bodyMedium.copyWith(
                            color: AppColors.success,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          'الاثنين - الجمعة: 9:00 ص - 5:00 م',
                          style: AppTextStyles.bodySmall.copyWith(
                            color: AppColors.textSecondary,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Switch(
                    value: true,
                    onChanged: (value) {
                      // Handle availability toggle
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            value ? 'تم تفعيل التوفر' : 'تم إلغاء التوفر',
                          ),
                          backgroundColor: value
                              ? AppColors.success
                              : AppColors.warning,
                        ),
                      );
                    },
                    activeColor: AppColors.success,
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                ],
              ),
            ),

            const SizedBox(height: AppSizes.paddingM),

            // Quick Stats
            Row(
              children: [
                Expanded(
                  child: _StatCard(
                    icon: AppIcons.appointments,
                    title: 'مواعيد اليوم',
                    value: '5',
                    color: AppColors.primary,
                  ),
                ),
                const SizedBox(width: AppSizes.paddingS),
                Expanded(
                  child: _StatCard(
                    icon: AppIcons.pending,
                    title: 'في الانتظار',
                    value: '3',
                    color: AppColors.warning,
                  ),
                ),
                const SizedBox(width: AppSizes.paddingS),
                Expanded(
                  child: _StatCard(
                    icon: AppIcons.completed,
                    title: 'مكتملة',
                    value: '12',
                    color: AppColors.success,
                  ),
                ),
              ],
            ),

            const SizedBox(height: AppSizes.paddingM),

            // Action Buttons
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () => Get.toNamed('/availability'),
                    icon: const Icon(AppIcons.settings, size: AppSizes.iconXS),
                    label: const Text('إدارة التوفر'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      foregroundColor: AppColors.primary,
                      side: BorderSide(color: AppColors.primary),
                      padding: const EdgeInsets.symmetric(
                        vertical: AppSizes.paddingS,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(AppSizes.radiusM),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: AppSizes.paddingS),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () => Get.toNamed('/appointments'),
                    icon: const Icon(AppIcons.add, size: AppSizes.iconXS),
                    label: const Text('جدولة موعد'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      foregroundColor: AppColors.textOnPrimary,
                      padding: const EdgeInsets.symmetric(
                        vertical: AppSizes.paddingS,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(AppSizes.radiusM),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;
  final Color color;

  const _StatCard({
    required this.icon,
    required this.title,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSizes.paddingS),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(AppSizes.radiusM),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Column(
        children: [
          Icon(icon, color: color, size: AppSizes.iconS),
          const SizedBox(height: AppSizes.paddingXS),
          Text(
            value,
            style: AppTextStyles.bodyLarge.copyWith(
              color: color,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            title,
            style: AppTextStyles.caption.copyWith(
              color: AppColors.textSecondary,
              fontSize: 10,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
