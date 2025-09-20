enum AppointmentStatus { pending, upcoming, completed, cancelled }

class AppointmentModel {
  final String id;
  final String patientName;
  final String patientAvatar;
  final String condition;
  final String visitType;
  final String time;
  final String date;
  final String appointmentDate;
  final AppointmentStatus status;
  final String? notes;

  AppointmentModel({
    required this.id,
    required this.patientName,
    required this.patientAvatar,
    required this.condition,
    required this.visitType,
    required this.time,
    required this.date,
    required this.appointmentDate,
    required this.status,
    this.notes,
  });

  factory AppointmentModel.fromJson(Map<String, dynamic> json) {
    return AppointmentModel(
      id: json['id'] ?? '',
      patientName: json['patientName'] ?? '',
      patientAvatar: json['patientAvatar'] ?? '',
      condition: json['condition'] ?? '',
      visitType: json['visitType'] ?? '',
      time: json['time'] ?? '',
      date: json['date'] ?? '',
      appointmentDate: json['appointmentDate'] ?? json['date'] ?? '',
      status: _parseStatus(json['status']),
      notes: json['notes'],
    );
  }

  static AppointmentStatus _parseStatus(String status) {
    switch (status.toLowerCase()) {
      case 'pending':
        return AppointmentStatus.pending;
      case 'upcoming':
        return AppointmentStatus.upcoming;
      case 'completed':
        return AppointmentStatus.completed;
      case 'cancelled':
        return AppointmentStatus.cancelled;
      default:
        return AppointmentStatus.pending;
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'patientName': patientName,
      'patientAvatar': patientAvatar,
      'condition': condition,
      'visitType': visitType,
      'time': time,
      'date': date,
      'appointmentDate': appointmentDate,
      'status': status.name,
      'notes': notes,
    };
  }

  AppointmentModel copyWith({
    String? id,
    String? patientName,
    String? patientAvatar,
    String? condition,
    String? visitType,
    String? time,
    String? date,
    String? appointmentDate,
    AppointmentStatus? status,
    String? notes,
  }) {
    return AppointmentModel(
      id: id ?? this.id,
      patientName: patientName ?? this.patientName,
      patientAvatar: patientAvatar ?? this.patientAvatar,
      condition: condition ?? this.condition,
      visitType: visitType ?? this.visitType,
      time: time ?? this.time,
      date: date ?? this.date,
      appointmentDate: appointmentDate ?? this.appointmentDate,
      status: status ?? this.status,
      notes: notes ?? this.notes,
    );
  }
}
