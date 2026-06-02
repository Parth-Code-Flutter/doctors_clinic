import 'package:doctors_clinic/constants/color_constants.dart';
import 'package:doctors_clinic/constants/string_constants.dart';
import 'package:flutter/material.dart';

enum AppointmentStatus { upcoming, inProgress, completed, cancelled, missed }

extension AppointmentStatusX on AppointmentStatus {
  String get label {
    switch (this) {
      case AppointmentStatus.upcoming:
        return kAppointmentStatusUpcoming;
      case AppointmentStatus.inProgress:
        return kDashboardStatusInProgress;
      case AppointmentStatus.completed:
        return kAppointmentStatusCompleted;
      case AppointmentStatus.cancelled:
        return kAppointmentStatusCancelled;
      case AppointmentStatus.missed:
        return kAppointmentStatusMissed;
    }
  }

  Color get color {
    switch (this) {
      case AppointmentStatus.upcoming:
        return kColorAppointmentPending;
      case AppointmentStatus.inProgress:
        return kColorLink;
      case AppointmentStatus.completed:
        return kColorAppointmentSuccess;
      case AppointmentStatus.cancelled:
        return kColorAppointmentCancelled;
      case AppointmentStatus.missed:
        return kColorAppointmentMissed;
    }
  }

  Color get backgroundColor => color.withValues(alpha: 0.12);

  String get storageValue {
    switch (this) {
      case AppointmentStatus.upcoming:
        return 'upcoming';
      case AppointmentStatus.inProgress:
        return 'in_progress';
      case AppointmentStatus.completed:
        return 'completed';
      case AppointmentStatus.cancelled:
        return 'cancelled';
      case AppointmentStatus.missed:
        return 'missed';
    }
  }

  static AppointmentStatus fromStorage(String? value) {
    switch (value) {
      case 'in_progress':
        return AppointmentStatus.inProgress;
      case 'completed':
        return AppointmentStatus.completed;
      case 'cancelled':
        return AppointmentStatus.cancelled;
      case 'missed':
        return AppointmentStatus.missed;
      default:
        return AppointmentStatus.upcoming;
    }
  }
}
