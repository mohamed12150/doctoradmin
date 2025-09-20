import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constants/index.dart';

class QuickStatsRow extends StatelessWidget {
  const QuickStatsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          Expanded(
            child: _StatItem(
              icon: AppIcons.appointments,
              title: 'مواعيد اليوم',
              value: '5',
              color: AppColors.primary,
              onTap: () => Get.toNamed('/appointments'),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: _StatItem(
              icon: AppIcons.pending,
              title: 'في الانتظار',
              value: '3',
              color: AppColors.warning,
              onTap: () => Get.toNamed('/appointments'),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: _StatItem(
              icon: AppIcons.completed,
              title: 'مكتملة',
              value: '12',
              color: AppColors.success,
              onTap: () => Get.toNamed('/appointments'),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: _StatItem(
              icon: AppIcons.availability,
              title: 'ساعات العمل',
              value: '8',
              color: AppColors.info,
              onTap: () => Get.toNamed('/availability'),
            ),
          ),
        ],
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;
  final Color color;
  final VoidCallback onTap;

  const _StatItem({
    required this.icon,
    required this.title,
    required this.value,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(AppSizes.radiusM),
          border: Border.all(color: color.withOpacity(0.3)),
        ),
        child: Column(
          children: [
            Icon(icon, color: color, size: AppSizes.iconM),
            const SizedBox(height: 8),
            Text(
              value,
              style: AppTextStyles.h6.copyWith(
                color: color,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              title,
              style: AppTextStyles.caption.copyWith(
                color: AppColors.textSecondary,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
