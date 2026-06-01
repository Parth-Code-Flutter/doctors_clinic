import 'dashboard_appointment_status.dart';

class DashboardAppointmentItem {
  const DashboardAppointmentItem({
    required this.id,
    required this.patientName,
    required this.timeLabel,
    required this.serviceLabel,
    required this.status,
  });

  final String id;
  final String patientName;
  final String timeLabel;
  final String serviceLabel;
  final DashboardAppointmentStatus status;
}
