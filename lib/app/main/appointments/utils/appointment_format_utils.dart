class AppointmentFormatUtils {
  AppointmentFormatUtils._();

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

  static const _weekdays = [
    'Mon',
    'Tue',
    'Wed',
    'Thu',
    'Fri',
    'Sat',
    'Sun',
  ];

  static String formatTime(DateTime dateTime) {
    final hour = dateTime.hour;
    final minute = dateTime.minute.toString().padLeft(2, '0');
    final period = hour >= 12 ? 'PM' : 'AM';
    final hour12 = hour % 12 == 0 ? 12 : hour % 12;
    return '$hour12:$minute $period';
  }

  static String formatDate(DateTime dateTime) {
    return '${_weekdays[dateTime.weekday - 1]}, ${dateTime.day} '
        '${_months[dateTime.month - 1]}';
  }

  static String formatDateLong(DateTime dateTime) {
    return '${_weekdays[dateTime.weekday - 1]}, ${dateTime.day} '
        '${_months[dateTime.month - 1]} ${dateTime.year}';
  }

  static String formatDayKey(DateTime dateTime) {
    return '${dateTime.year}-${dateTime.month}-${dateTime.day}';
  }

  static String daySectionTitle(DateTime dateTime, {DateTime? now}) {
    final reference = now ?? DateTime.now();
    if (dateTime.year == reference.year &&
        dateTime.month == reference.month &&
        dateTime.day == reference.day) {
      return 'Today';
    }
    final tomorrow = DateTime(reference.year, reference.month, reference.day + 1);
    if (dateTime.year == tomorrow.year &&
        dateTime.month == tomorrow.month &&
        dateTime.day == tomorrow.day) {
      return 'Tomorrow';
    }
    return formatDate(dateTime);
  }
}
