import 'package:doctors_clinic/app/main/reminders/models/reminder_status.dart';
import 'package:doctors_clinic/constants/string_constants.dart';

class ReminderFormatUtils {
  ReminderFormatUtils._();

  static const _weekdays = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];

  static const _months = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec',
  ];

  static String formatTime(DateTime dateTime) {
    final hour = dateTime.hour % 12 == 0 ? 12 : dateTime.hour % 12;
    final minute = dateTime.minute.toString().padLeft(2, '0');
    final period = dateTime.hour >= 12 ? 'PM' : 'AM';
    return '$hour:$minute $period';
  }

  static String formatDateTime(DateTime dateTime) {
    final weekday = _weekdays[dateTime.weekday - 1];
    final month = _months[dateTime.month - 1];
    return '$weekday, ${dateTime.day} $month · ${formatTime(dateTime)}';
  }

  static Duration offsetForTimingLabel(String label) {
    if (label.startsWith('15')) {
      return const Duration(minutes: 15);
    }
    if (label.startsWith('30')) {
      return const Duration(minutes: 30);
    }
    if (label.startsWith('1 hour')) {
      return const Duration(hours: 1);
    }
    if (label.startsWith('24')) {
      return const Duration(hours: 24);
    }
    return const Duration(minutes: 30);
  }

  static String statusLabel(ReminderStatus status) {
    switch (status) {
      case ReminderStatus.scheduled:
        return kRemindersStatusScheduled;
      case ReminderStatus.sent:
        return kRemindersStatusSent;
      case ReminderStatus.failed:
        return kRemindersStatusFailed;
    }
  }
}
