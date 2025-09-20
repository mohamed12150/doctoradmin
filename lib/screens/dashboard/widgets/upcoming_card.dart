import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui_doc/controllers/appointment_controller_new.dart';

import 'package:ui_doc/models/appointment_model.dart';
import 'package:ui_doc/widgets/image_placeholder.dart';

class UpcomingAppointmentCard extends StatelessWidget {
  const UpcomingAppointmentCard({super.key});
  @override
  Widget build(BuildContext context) {
    final AppointmentController appointmentController =
        Get.find<AppointmentController>();

    return Obx(() {
      final upcomingAppointments = appointmentController.appointments
          .where((apt) => apt.status == AppointmentStatus.upcoming)
          .toList();

      if (upcomingAppointments.isEmpty) {
        return const SizedBox.shrink();
      }

      final nextAppointment = upcomingAppointments.first;

      return Container(
        decoration: BoxDecoration(
          color: const Color(0xFFFF8A00),
          borderRadius: BorderRadius.circular(16),
        ),
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                ImagePlaceholder(
                  imagePath: nextAppointment.patientAvatar,
                  width: 36,
                  height: 36,
                  radius: 18,
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        nextAppointment.patientName,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        '${nextAppointment.condition}  •  ${nextAppointment.visitType}',
                        style: const TextStyle(color: Colors.white70),
                      ),
                    ],
                  ),
                ),
                TextButton(
                  onPressed: () => Get.toNamed('/appointments'),
                  child: const Text(
                    'See All',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              child: Row(
                children: [
                  const Icon(Icons.calendar_month, color: Color(0xFF2A1759)),
                  const SizedBox(width: 8),
                  Expanded(child: Text(nextAppointment.date)),
                  const Icon(Icons.access_time, color: Color(0xFF2A1759)),
                  const SizedBox(width: 6),
                  Text(nextAppointment.time),
                ],
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                      // TODO: Implement reschedule functionality
                      Get.snackbar(
                        'Reschedule',
                        'Reschedule functionality will be implemented',
                        snackPosition: SnackPosition.BOTTOM,
                      );
                    },
                    style: OutlinedButton.styleFrom(
                      foregroundColor: const Color(0xFF2A1759),
                      side: const BorderSide(color: Colors.white),
                      backgroundColor: Colors.white,
                      minimumSize: const Size.fromHeight(44),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text('Reschedule'),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      // TODO: Implement join session functionality
                      Get.snackbar(
                        'Join Session',
                        'Join session functionality will be implemented',
                        snackPosition: SnackPosition.BOTTOM,
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF2A1759),
                      minimumSize: const Size.fromHeight(44),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text('Join Session'),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    });
  }
}
