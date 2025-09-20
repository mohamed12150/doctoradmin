import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui_doc/controllers/user_controller.dart';
import 'package:ui_doc/controllers/notification_controller.dart';
import '../../../core/constants/index.dart';

class DashboardHeader extends StatelessWidget {
  const DashboardHeader({super.key});
  @override
  Widget build(BuildContext context) {
    final UserController userController = Get.find<UserController>();
    final NotificationController notificationController =
        Get.find<NotificationController>();

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Main Header Row
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Obx(
                      () => Text(
                        'مرحباً د. ${userController.user?.name.split(' ').first ?? 'المستخدم'}!',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 26,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                    const SizedBox(height: 6),
                    const Text(
                      'اليوم يوم مزدحم بالمواعيد',
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () => Get.toNamed('/notifications'),
                child: Stack(
                  children: [
                    Container(
                      width: 42,
                      height: 42,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(
                        Icons.notifications_none,
                        color: Color(0xFF2A1759),
                      ),
                    ),
                    Obx(
                      () => notificationController.unreadCount > 0
                          ? Positioned(
                              right: 4,
                              top: 4,
                              child: Container(
                                width: 10,
                                height: 10,
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                ),
                                child: const DecoratedBox(
                                  decoration: BoxDecoration(
                                    color: Color(0xFFFF6A2A),
                                    shape: BoxShape.circle,
                                  ),
                                ),
                              ),
                            )
                          : const SizedBox.shrink(),
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          // Quick Action Buttons
          Row(
            children: [
              Expanded(
                child: _QuickActionButton(
                  icon: AppIcons.appointments,
                  title: 'المواعيد',
                  subtitle: '5 مواعيد اليوم',
                  onTap: () => Get.toNamed('/appointments'),
                  color: Colors.white,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _QuickActionButton(
                  icon: AppIcons.settings,
                  title: 'التوفر',
                  subtitle: 'متاح الآن',
                  onTap: () => Get.toNamed('/availability'),
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _QuickActionButton extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;
  final Color color;

  const _QuickActionButton({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: color.withOpacity(0.2),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: color.withOpacity(0.3)),
        ),
        child: Row(
          children: [
            Icon(icon, color: color, size: 20),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: color,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    subtitle,
                    style: TextStyle(
                      color: color.withOpacity(0.8),
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
