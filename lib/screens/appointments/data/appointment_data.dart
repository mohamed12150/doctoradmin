import '../../../models/appointment_model.dart';

class AppointmentData {
  static List<AppointmentModel> getMockAppointments() {
    return [
      AppointmentModel(
        id: '1',
        patientName: 'أحمد محمد',
        patientAvatar: 'assets/images/mm.png',
        condition: 'ألم في الصدر',
        visitType: 'استشارة',
        time: '10:30 ص',
        date: '2024-01-15',
        appointmentDate: '15 يناير 2024',
        status: AppointmentStatus.pending,
        notes: 'موعد استشارة طبية',
      ),
      AppointmentModel(
        id: '2',
        patientName: 'فاطمة علي',
        patientAvatar: 'assets/images/mm.png',
        condition: 'متابعة بعد العملية',
        visitType: 'متابعة',
        time: '2:00 م',
        date: '2024-01-16',
        appointmentDate: '16 يناير 2024',
        status: AppointmentStatus.upcoming,
        notes: 'موعد متابعة بعد العملية',
      ),
      AppointmentModel(
        id: '3',
        patientName: 'محمد عبدالله',
        patientAvatar: 'assets/images/mm.png',
        condition: 'طوارئ',
        visitType: 'طوارئ',
        time: '11:00 ص',
        date: '2024-01-17',
        appointmentDate: '17 يناير 2024',
        status: AppointmentStatus.pending,
        notes: 'موعد طوارئ',
      ),
      AppointmentModel(
        id: '4',
        patientName: 'نورا سالم',
        patientAvatar: 'assets/images/mm.png',
        condition: 'فحص دوري',
        visitType: 'فحص',
        time: '9:00 ص',
        date: '2024-01-14',
        appointmentDate: '14 يناير 2024',
        status: AppointmentStatus.completed,
        notes: 'فحص دوري',
      ),
      AppointmentModel(
        id: '5',
        patientName: 'خالد حسن',
        patientAvatar: 'assets/images/mm.png',
        condition: 'استشارة',
        visitType: 'استشارة',
        time: '3:00 م',
        date: '2024-01-18',
        appointmentDate: '18 يناير 2024',
        status: AppointmentStatus.cancelled,
        notes: 'موعد ملغي',
      ),
    ];
  }

  static List<String> getFilterOptions() {
    return ['All', 'Pending', 'Upcoming', 'Completed', 'Cancelled'];
  }

  static List<AppointmentModel> filterAppointments(
    List<AppointmentModel> appointments,
    String filter,
  ) {
    if (filter == 'All') return appointments;

    final status = AppointmentStatus.values.firstWhere(
      (e) => e.name.toLowerCase() == filter.toLowerCase(),
      orElse: () => AppointmentStatus.pending,
    );

    return appointments
        .where((appointment) => appointment.status == status)
        .toList();
  }

  static List<AppointmentModel> searchAppointments(
    List<AppointmentModel> appointments,
    String query,
  ) {
    if (query.isEmpty) return appointments;

    final lowercaseQuery = query.toLowerCase();
    return appointments.where((appointment) {
      return appointment.patientName.toLowerCase().contains(lowercaseQuery) ||
          appointment.condition.toLowerCase().contains(lowercaseQuery) ||
          appointment.visitType.toLowerCase().contains(lowercaseQuery) ||
          (appointment.notes?.toLowerCase().contains(lowercaseQuery) ?? false);
    }).toList();
  }
}
