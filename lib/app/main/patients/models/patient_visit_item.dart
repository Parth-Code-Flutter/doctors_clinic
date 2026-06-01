class PatientVisitItem {
  const PatientVisitItem({
    required this.dateLabel,
    required this.timeLabel,
    required this.reason,
    required this.statusLabel,
    required this.isUpcoming,
  });

  final String dateLabel;
  final String timeLabel;
  final String reason;
  final String statusLabel;
  final bool isUpcoming;
}
