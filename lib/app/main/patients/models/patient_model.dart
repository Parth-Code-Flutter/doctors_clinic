import 'patient_gender.dart';

class PatientModel {
  PatientModel({
    required this.id,
    required this.fullName,
    required this.phone,
    required this.gender,
    this.age,
    this.dateOfBirth,
    this.address,
    this.notes,
    this.lastVisitAt,
    this.nextAppointmentAt,
    required this.createdAt,
    DateTime? updatedAt,
  }) : updatedAt = updatedAt ?? createdAt;

  final String id;
  final String fullName;
  final String phone;
  final PatientGender gender;
  final int? age;
  final DateTime? dateOfBirth;
  final String? address;
  final String? notes;
  final DateTime? lastVisitAt;
  final DateTime? nextAppointmentAt;
  final DateTime createdAt;
  final DateTime updatedAt;

  String get initials {
    final parts = fullName.trim().split(RegExp(r'\s+'));
    if (parts.isEmpty) {
      return '?';
    }
    if (parts.length == 1) {
      return parts.first.substring(0, 1).toUpperCase();
    }
    return '${parts.first[0]}${parts.last[0]}'.toUpperCase();
  }

  int get avatarColorIndex =>
      fullName.codeUnits.fold(0, (sum, code) => sum + code) % 5;

  bool get hasUpcomingVisit => nextAppointmentAt != null;

  PatientModel copyWith({
    String? id,
    String? fullName,
    String? phone,
    PatientGender? gender,
    int? age,
    DateTime? dateOfBirth,
    String? address,
    String? notes,
    DateTime? lastVisitAt,
    DateTime? nextAppointmentAt,
    DateTime? createdAt,
    DateTime? updatedAt,
    bool clearAge = false,
    bool clearDateOfBirth = false,
    bool clearAddress = false,
    bool clearNotes = false,
    bool clearLastVisit = false,
    bool clearNextAppointment = false,
  }) {
    return PatientModel(
      id: id ?? this.id,
      fullName: fullName ?? this.fullName,
      phone: phone ?? this.phone,
      gender: gender ?? this.gender,
      age: clearAge ? null : (age ?? this.age),
      dateOfBirth: clearDateOfBirth ? null : (dateOfBirth ?? this.dateOfBirth),
      address: clearAddress ? null : (address ?? this.address),
      notes: clearNotes ? null : (notes ?? this.notes),
      lastVisitAt: clearLastVisit ? null : (lastVisitAt ?? this.lastVisitAt),
      nextAppointmentAt: clearNextAppointment
          ? null
          : (nextAppointmentAt ?? this.nextAppointmentAt),
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? DateTime.now(),
    );
  }
}
