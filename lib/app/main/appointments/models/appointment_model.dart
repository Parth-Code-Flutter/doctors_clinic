import 'appointment_status.dart';

class AppointmentModel {
  AppointmentModel({
    required this.id,
    required this.patientId,
    required this.patientName,
    required this.patientPhone,
    required this.scheduledAt,
    required this.status,
    this.reason,
    this.notes,
    this.reminderLabel = '30 minutes before',
    this.reminderSent = false,
    required this.createdAt,
    DateTime? updatedAt,
  }) : updatedAt = updatedAt ?? createdAt;

  final String id;
  final String patientId;
  final String patientName;
  final String patientPhone;
  final DateTime scheduledAt;
  final AppointmentStatus status;
  final String? reason;
  final String? notes;
  final String reminderLabel;
  final bool reminderSent;
  final DateTime createdAt;
  final DateTime updatedAt;

  bool get isToday {
    final now = DateTime.now();
    return scheduledAt.year == now.year &&
        scheduledAt.month == now.month &&
        scheduledAt.day == now.day;
  }

  AppointmentModel copyWith({
    AppointmentStatus? status,
    DateTime? scheduledAt,
    String? reason,
    String? notes,
    String? reminderLabel,
    bool? reminderSent,
    DateTime? updatedAt,
    bool clearReason = false,
    bool clearNotes = false,
  }) {
    return AppointmentModel(
      id: id,
      patientId: patientId,
      patientName: patientName,
      patientPhone: patientPhone,
      scheduledAt: scheduledAt ?? this.scheduledAt,
      status: status ?? this.status,
      reason: clearReason ? null : (reason ?? this.reason),
      notes: clearNotes ? null : (notes ?? this.notes),
      reminderLabel: reminderLabel ?? this.reminderLabel,
      reminderSent: reminderSent ?? this.reminderSent,
      createdAt: createdAt,
      updatedAt: updatedAt ?? DateTime.now(),
    );
  }
}
