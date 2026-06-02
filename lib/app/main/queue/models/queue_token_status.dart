import 'package:doctors_clinic/constants/color_constants.dart';
import 'package:doctors_clinic/constants/string_constants.dart';
import 'package:flutter/material.dart';

enum QueueTokenStatus {
  waiting,
  withDoctor,
  completed,
  skipped,
}

extension QueueTokenStatusX on QueueTokenStatus {
  String get label {
    switch (this) {
      case QueueTokenStatus.waiting:
        return kQueueStatusWaiting;
      case QueueTokenStatus.withDoctor:
        return kQueueStatusWithDoctor;
      case QueueTokenStatus.completed:
        return kQueueStatusCompleted;
      case QueueTokenStatus.skipped:
        return kQueueStatusSkipped;
    }
  }

  Color get color {
    switch (this) {
      case QueueTokenStatus.waiting:
        return kColorAppointmentPending;
      case QueueTokenStatus.withDoctor:
        return kColorLink;
      case QueueTokenStatus.completed:
        return kColorAppointmentSuccess;
      case QueueTokenStatus.skipped:
        return kColorAppointmentMissed;
    }
  }
}
