import 'package:doctors_clinic/app/main/followups/models/follow_up_status.dart';

class FollowUpModel {
  const FollowUpModel({
    required this.id,
    required this.patientId,
    required this.patientName,
    required this.patientPhone,
    required this.scheduledAt,
    required this.status,
    this.reason,
    this.notes,
    this.visitId,
    this.receiptId,
    this.completedAt,
  });

  final String id;
  final String patientId;
  final String patientName;
  final String patientPhone;
  final DateTime scheduledAt;
  final FollowUpStatus status;
  final String? reason;
  final String? notes;
  final String? visitId;
  final String? receiptId;
  final DateTime? completedAt;

  FollowUpModel copyWith({
    DateTime? scheduledAt,
    FollowUpStatus? status,
    String? reason,
    String? notes,
    DateTime? completedAt,
    bool clearCompletedAt = false,
    bool clearReason = false,
    bool clearNotes = false,
  }) {
    return FollowUpModel(
      id: id,
      patientId: patientId,
      patientName: patientName,
      patientPhone: patientPhone,
      scheduledAt: scheduledAt ?? this.scheduledAt,
      status: status ?? this.status,
      reason: clearReason ? null : (reason ?? this.reason),
      notes: clearNotes ? null : (notes ?? this.notes),
      visitId: visitId,
      receiptId: receiptId,
      completedAt: clearCompletedAt ? null : (completedAt ?? this.completedAt),
    );
  }
}
