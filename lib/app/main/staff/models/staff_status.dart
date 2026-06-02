enum StaffStatus { active, onLeave, inactive }

extension StaffStatusX on StaffStatus {
  String get label {
    switch (this) {
      case StaffStatus.active:
        return 'Active';
      case StaffStatus.onLeave:
        return 'On leave';
      case StaffStatus.inactive:
        return 'Inactive';
    }
  }
}
