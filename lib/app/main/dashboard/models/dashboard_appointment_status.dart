import 'package:doctors_clinic/constants/color_constants.dart';
import 'package:doctors_clinic/constants/string_constants.dart';
import 'package:flutter/material.dart';

enum DashboardAppointmentStatus { upcoming, inProgress, completed, cancelled }

extension DashboardAppointmentStatusX on DashboardAppointmentStatus {
  String get label {
    switch (this) {
      case DashboardAppointmentStatus.upcoming:
        return kDashboardStatusUpcoming;
      case DashboardAppointmentStatus.inProgress:
        return kDashboardStatusInProgress;
      case DashboardAppointmentStatus.completed:
        return kDashboardStatusCompleted;
      case DashboardAppointmentStatus.cancelled:
        return kDashboardStatusCancelled;
    }
  }

  Color get color {
    switch (this) {
      case DashboardAppointmentStatus.upcoming:
        return kColorAppointmentPending;
      case DashboardAppointmentStatus.inProgress:
        return kColorLink;
      case DashboardAppointmentStatus.completed:
        return kColorAppointmentSuccess;
      case DashboardAppointmentStatus.cancelled:
        return kColorAppointmentCancelled;
    }
  }

  Color get backgroundColor => color.withValues(alpha: 0.12);
}
