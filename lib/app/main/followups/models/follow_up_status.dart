enum FollowUpStatus { scheduled, completed, missed }

extension FollowUpStatusX on FollowUpStatus {
  String get label {
    switch (this) {
      case FollowUpStatus.scheduled:
        return 'Scheduled';
      case FollowUpStatus.completed:
        return 'Completed';
      case FollowUpStatus.missed:
        return 'Missed';
    }
  }
}
