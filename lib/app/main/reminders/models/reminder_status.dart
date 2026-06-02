import 'package:doctors_clinic/constants/color_constants.dart';
import 'package:flutter/material.dart';

enum ReminderStatus { scheduled, sent, failed }

extension ReminderStatusX on ReminderStatus {
  Color get color {
    switch (this) {
      case ReminderStatus.scheduled:
        return kColorLink;
      case ReminderStatus.sent:
        return kColorAppointmentSuccess;
      case ReminderStatus.failed:
        return kColorAppointmentMissed;
    }
  }
}
