import 'package:doctors_clinic/app/main/doctors/models/doctor_status.dart';

class DoctorModel {
  const DoctorModel({
    required this.id,
    required this.fullName,
    required this.specialization,
    required this.phone,
    required this.status,
    this.email,
    this.experienceLabel,
    this.opdTimings,
    this.notes,
  });

  final String id;
  final String fullName;
  final String specialization;
  final String phone;
  final DoctorStatus status;
  final String? email;
  final String? experienceLabel;
  final String? opdTimings;
  final String? notes;

  DoctorModel copyWith({
    String? fullName,
    String? specialization,
    String? phone,
    DoctorStatus? status,
    String? email,
    String? experienceLabel,
    String? opdTimings,
    String? notes,
    bool clearEmail = false,
    bool clearExperience = false,
    bool clearOpdTimings = false,
    bool clearNotes = false,
  }) {
    return DoctorModel(
      id: id,
      fullName: fullName ?? this.fullName,
      specialization: specialization ?? this.specialization,
      phone: phone ?? this.phone,
      status: status ?? this.status,
      email: clearEmail ? null : (email ?? this.email),
      experienceLabel: clearExperience ? null : (experienceLabel ?? this.experienceLabel),
      opdTimings: clearOpdTimings ? null : (opdTimings ?? this.opdTimings),
      notes: clearNotes ? null : (notes ?? this.notes),
    );
  }
}
