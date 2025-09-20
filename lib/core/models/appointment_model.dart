enum AppointmentStatus { pending, confirmed, completed, cancelled }

enum AppointmentType { consultation, followUp, emergency, routine }

class AppointmentModel {
  final String id;
  final String patientId;
  final String patientName;
  final String patientEmail;
  final String patientPhone;
  final String patientAvatar;
  final String doctorId;
  final String doctorName;
  final String doctorSpecialization;
  final DateTime dateTime;
  final int duration; // in minutes
  final AppointmentStatus status;
  final AppointmentType type;
  final String notes;
  final String location;
  final String meetingLink;
  final DateTime createdAt;
  final DateTime updatedAt;

  AppointmentModel({
    required this.id,
    required this.patientId,
    required this.patientName,
    required this.patientEmail,
    required this.patientPhone,
    required this.patientAvatar,
    required this.doctorId,
    required this.doctorName,
    required this.doctorSpecialization,
    required this.dateTime,
    required this.duration,
    required this.status,
    required this.type,
    required this.notes,
    required this.location,
    required this.meetingLink,
    required this.createdAt,
    required this.updatedAt,
  });

  factory AppointmentModel.fromJson(Map<String, dynamic> json) {
    return AppointmentModel(
      id: json['id'] ?? '',
      patientId: json['patientId'] ?? '',
      patientName: json['patientName'] ?? '',
      patientEmail: json['patientEmail'] ?? '',
      patientPhone: json['patientPhone'] ?? '',
      patientAvatar: json['patientAvatar'] ?? '',
      doctorId: json['doctorId'] ?? '',
      doctorName: json['doctorName'] ?? '',
      doctorSpecialization: json['doctorSpecialization'] ?? '',
      dateTime: DateTime.parse(
        json['dateTime'] ?? DateTime.now().toIso8601String(),
      ),
      duration: json['duration'] ?? 30,
      status: AppointmentStatus.values.firstWhere(
        (e) => e.name == json['status'],
        orElse: () => AppointmentStatus.pending,
      ),
      type: AppointmentType.values.firstWhere(
        (e) => e.name == json['type'],
        orElse: () => AppointmentType.consultation,
      ),
      notes: json['notes'] ?? '',
      location: json['location'] ?? '',
      meetingLink: json['meetingLink'] ?? '',
      createdAt: DateTime.parse(
        json['createdAt'] ?? DateTime.now().toIso8601String(),
      ),
      updatedAt: DateTime.parse(
        json['updatedAt'] ?? DateTime.now().toIso8601String(),
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'patientId': patientId,
      'patientName': patientName,
      'patientEmail': patientEmail,
      'patientPhone': patientPhone,
      'patientAvatar': patientAvatar,
      'doctorId': doctorId,
      'doctorName': doctorName,
      'doctorSpecialization': doctorSpecialization,
      'dateTime': dateTime.toIso8601String(),
      'duration': duration,
      'status': status.name,
      'type': type.name,
      'notes': notes,
      'location': location,
      'meetingLink': meetingLink,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }

  AppointmentModel copyWith({
    String? id,
    String? patientId,
    String? patientName,
    String? patientEmail,
    String? patientPhone,
    String? patientAvatar,
    String? doctorId,
    String? doctorName,
    String? doctorSpecialization,
    DateTime? dateTime,
    int? duration,
    AppointmentStatus? status,
    AppointmentType? type,
    String? notes,
    String? location,
    String? meetingLink,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return AppointmentModel(
      id: id ?? this.id,
      patientId: patientId ?? this.patientId,
      patientName: patientName ?? this.patientName,
      patientEmail: patientEmail ?? this.patientEmail,
      patientPhone: patientPhone ?? this.patientPhone,
      patientAvatar: patientAvatar ?? this.patientAvatar,
      doctorId: doctorId ?? this.doctorId,
      doctorName: doctorName ?? this.doctorName,
      doctorSpecialization: doctorSpecialization ?? this.doctorSpecialization,
      dateTime: dateTime ?? this.dateTime,
      duration: duration ?? this.duration,
      status: status ?? this.status,
      type: type ?? this.type,
      notes: notes ?? this.notes,
      location: location ?? this.location,
      meetingLink: meetingLink ?? this.meetingLink,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is AppointmentModel && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() {
    return 'AppointmentModel(id: $id, patientName: $patientName, dateTime: $dateTime, status: $status)';
  }
}
