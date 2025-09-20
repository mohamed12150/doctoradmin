import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui_doc/controllers/appointment_controller_new.dart';

import 'package:ui_doc/models/appointment_model.dart';
import 'package:ui_doc/widgets/image_placeholder.dart';

class PendingAppointmentCard extends StatelessWidget {
  const PendingAppointmentCard({super.key});
  @override
  Widget build(BuildContext context) {
    final AppointmentController appointmentController =
        Get.find<AppointmentController>();

    return Obx(() {
      final pendingAppointments = appointmentController.appointments
          .where((apt) => apt.status == AppointmentStatus.pending)
          .toList();

      if (pendingAppointments.isEmpty) {
        return const SizedBox.shrink();
      }

      final nextPendingAppointment = pendingAppointments.first;

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Pending Appointment',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
              ),
              TextButton(
                onPressed: () => Get.toNamed('/appointments'),
                child: const Text('See All'),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.06),
                  blurRadius: 12,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            padding: const EdgeInsets.all(12),
            child: Column(
              children: [
                Row(
                  children: [
                    ImagePlaceholder(
                      imagePath: nextPendingAppointment.patientAvatar,
                      width: 44,
                      height: 44,
                      radius: 22,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            nextPendingAppointment.patientName,
                            style: const TextStyle(fontWeight: FontWeight.w700),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            '${nextPendingAppointment.condition}  •  ${nextPendingAppointment.visitType}',
                            style: const TextStyle(color: Colors.black54),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            'Pending    ${nextPendingAppointment.time}',
                            style: const TextStyle(color: Colors.black54),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 6,
                      ),
                      decoration: const BoxDecoration(
                        color: Color(0xFFF5F5F7),
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(12),
                          bottomLeft: Radius.circular(12),
                        ),
                      ),
                      child: Text(
                        nextPendingAppointment.appointmentDate.replaceAll(
                          ' ',
                          '\n',
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () {
                          appointmentController.declineAppointment(
                            nextPendingAppointment.id,
                          );
                          Get.snackbar(
                            'Declined',
                            'Appointment has been declined',
                            snackPosition: SnackPosition.BOTTOM,
                            backgroundColor: Colors.red,
                            colorText: Colors.white,
                          );
                        },
                        style: OutlinedButton.styleFrom(
                          minimumSize: const Size.fromHeight(44),
                          side: const BorderSide(color: Color(0xFFFF6A2A)),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Text(
                          'Decline',
                          style: TextStyle(color: Color(0xFFFF6A2A)),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () {
                          appointmentController.acceptAppointment(
                            nextPendingAppointment.id,
                          );
                          Get.snackbar(
                            'Accepted',
                            'Appointment has been accepted',
                            snackPosition: SnackPosition.BOTTOM,
                            backgroundColor: Colors.green,
                            colorText: Colors.white,
                          );
                        },
                        style: OutlinedButton.styleFrom(
                          minimumSize: const Size.fromHeight(44),
                          side: const BorderSide(color: Color(0xFFB8E6C0)),
                          backgroundColor: const Color(0xFFEAF9EE),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Text(
                          'Accept',
                          style: TextStyle(color: Color(0xFF2E7D32)),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      );
    });
  }
}
