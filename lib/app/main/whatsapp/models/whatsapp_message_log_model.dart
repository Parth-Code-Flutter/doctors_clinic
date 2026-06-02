import 'whatsapp_log_status.dart';

class WhatsAppMessageLogModel {
  WhatsAppMessageLogModel({
    required this.id,
    required this.patientId,
    required this.patientName,
    required this.patientPhone,
    required this.templateTitle,
    required this.preview,
    required this.status,
    required this.sentAt,
    this.failureReason,
  });

  final String id;
  final String patientId;
  final String patientName;
  final String patientPhone;
  final String templateTitle;
  final String preview;
  final WhatsAppLogStatus status;
  final DateTime sentAt;
  final String? failureReason;

  bool get isToday {
    final now = DateTime.now();
    return sentAt.year == now.year &&
        sentAt.month == now.month &&
        sentAt.day == now.day;
  }

  WhatsAppMessageLogModel copyWith({
    String? templateTitle,
    String? preview,
    WhatsAppLogStatus? status,
    DateTime? sentAt,
    String? failureReason,
    bool clearFailureReason = false,
  }) {
    return WhatsAppMessageLogModel(
      id: id,
      patientId: patientId,
      patientName: patientName,
      patientPhone: patientPhone,
      templateTitle: templateTitle ?? this.templateTitle,
      preview: preview ?? this.preview,
      status: status ?? this.status,
      sentAt: sentAt ?? this.sentAt,
      failureReason:
          clearFailureReason ? null : (failureReason ?? this.failureReason),
    );
  }
}
