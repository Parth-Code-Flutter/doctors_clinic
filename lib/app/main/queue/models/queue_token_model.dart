import 'queue_token_status.dart';

class QueueTokenModel {
  QueueTokenModel({
    required this.id,
    required this.tokenNumber,
    required this.patientId,
    required this.patientName,
    required this.patientPhone,
    this.reason,
    this.notes,
    required this.isPriority,
    required this.status,
    required this.checkedInAt,
    this.startedAt,
    this.completedAt,
  });

  final String id;
  final int tokenNumber;
  final String patientId;
  final String patientName;
  final String patientPhone;
  final String? reason;
  final String? notes;
  final bool isPriority;
  final QueueTokenStatus status;
  final DateTime checkedInAt;
  final DateTime? startedAt;
  final DateTime? completedAt;

  QueueTokenModel copyWith({
    int? tokenNumber,
    String? reason,
    String? notes,
    bool? isPriority,
    QueueTokenStatus? status,
    DateTime? checkedInAt,
    DateTime? startedAt,
    DateTime? completedAt,
    bool clearReason = false,
    bool clearNotes = false,
    bool clearStartedAt = false,
    bool clearCompletedAt = false,
  }) {
    return QueueTokenModel(
      id: id,
      tokenNumber: tokenNumber ?? this.tokenNumber,
      patientId: patientId,
      patientName: patientName,
      patientPhone: patientPhone,
      reason: clearReason ? null : (reason ?? this.reason),
      notes: clearNotes ? null : (notes ?? this.notes),
      isPriority: isPriority ?? this.isPriority,
      status: status ?? this.status,
      checkedInAt: checkedInAt ?? this.checkedInAt,
      startedAt: clearStartedAt ? null : (startedAt ?? this.startedAt),
      completedAt:
          clearCompletedAt ? null : (completedAt ?? this.completedAt),
    );
  }
}
