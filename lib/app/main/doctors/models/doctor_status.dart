enum DoctorStatus { available, busy, offDuty }

extension DoctorStatusX on DoctorStatus {
  String get label {
    switch (this) {
      case DoctorStatus.available:
        return 'Available';
      case DoctorStatus.busy:
        return 'Busy';
      case DoctorStatus.offDuty:
        return 'Off duty';
    }
  }
}
