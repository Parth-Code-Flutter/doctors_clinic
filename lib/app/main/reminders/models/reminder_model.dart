import 'reminder_status.dart';

class ReminderModel {
  ReminderModel({
    required this.id,
    required this.appointmentId,
    required this.patientName,
    required this.patientPhone,
    required this.appointmentAt,
    required this.deliverAt,
    required this.status,
    required this.channelLabel,
    required this.timingLabel,
    this.sentAt,
    this.failureMessage,
    required this.createdAt,
  });

  final String id;
  final String appointmentId;
  final String patientName;
  final String patientPhone;
  final DateTime appointmentAt;
  final DateTime deliverAt;
  final ReminderStatus status;
  final String channelLabel;
  final String timingLabel;
  final DateTime? sentAt;
  final String? failureMessage;
  final DateTime createdAt;

  bool get isDeliverToday {
    final now = DateTime.now();
    return deliverAt.year == now.year &&
        deliverAt.month == now.month &&
        deliverAt.day == now.day;
  }

  ReminderModel copyWith({
    String? id,
    ReminderStatus? status,
    DateTime? sentAt,
    String? failureMessage,
    bool clearFailureMessage = false,
    bool clearSentAt = false,
  }) {
    return ReminderModel(
      id: id ?? this.id,
      appointmentId: appointmentId,
      patientName: patientName,
      patientPhone: patientPhone,
      appointmentAt: appointmentAt,
      deliverAt: deliverAt,
      status: status ?? this.status,
      channelLabel: channelLabel,
      timingLabel: timingLabel,
      sentAt: clearSentAt ? null : (sentAt ?? this.sentAt),
      failureMessage: clearFailureMessage
          ? null
          : (failureMessage ?? this.failureMessage),
      createdAt: createdAt,
    );
  }
}
