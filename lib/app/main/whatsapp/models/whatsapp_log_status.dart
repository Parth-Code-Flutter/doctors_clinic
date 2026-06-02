import 'package:doctors_clinic/constants/color_constants.dart';
import 'package:flutter/material.dart';

enum WhatsAppLogStatus { queued, sent, failed }

extension WhatsAppLogStatusX on WhatsAppLogStatus {
  Color get color {
    switch (this) {
      case WhatsAppLogStatus.queued:
        return kColorAppointmentPending;
      case WhatsAppLogStatus.sent:
        return kColorAppointmentSuccess;
      case WhatsAppLogStatus.failed:
        return kColorAppointmentMissed;
    }
  }
}
