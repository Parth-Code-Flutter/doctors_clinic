enum StaffRole { receptionist, nurse, assistant, manager }

extension StaffRoleX on StaffRole {
  String get label {
    switch (this) {
      case StaffRole.receptionist:
        return 'Receptionist';
      case StaffRole.nurse:
        return 'Nurse';
      case StaffRole.assistant:
        return 'Assistant';
      case StaffRole.manager:
        return 'Manager';
    }
  }
}
