import 'package:doctors_clinic/constants/color_constants.dart';
import 'package:doctors_clinic/constants/string_constants.dart';
import 'package:doctors_clinic/utils/text_utils/app_text.dart';
import 'package:doctors_clinic/utils/text_utils/text_styles.dart';
import 'package:flutter/material.dart';

class ReminderSummaryStrip extends StatelessWidget {
  const ReminderSummaryStrip({
    required this.scheduledCount,
    required this.sentTodayCount,
    required this.failedCount,
    super.key,
  });

  final int scheduledCount;
  final int sentTodayCount;
  final int failedCount;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _SummaryCard(
            label: kRemindersSummaryScheduled,
            value: scheduledCount.toString(),
            icon: Icons.schedule_send_rounded,
            iconColor: kColorLink,
            background: kColorSecondaryButtonBackground,
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: _SummaryCard(
            label: kRemindersSummarySentToday,
            value: sentTodayCount.toString(),
            icon: Icons.check_circle_outline_rounded,
            iconColor: kColorAppointmentSuccess,
            background: const Color(0xFFDCFCE7),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: _SummaryCard(
            label: kRemindersSummaryFailed,
            value: failedCount.toString(),
            icon: Icons.error_outline_rounded,
            iconColor: kColorAppointmentMissed,
            background: const Color(0xFFFEE2E2),
          ),
        ),
      ],
    );
  }
}

class _SummaryCard extends StatelessWidget {
  const _SummaryCard({
    required this.label,
    required this.value,
    required this.icon,
    required this.iconColor,
    required this.background,
  });

  final String label;
  final String value;
  final IconData icon;
  final Color iconColor;
  final Color background;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: kColorBorder),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: iconColor, size: 20),
          const SizedBox(height: 6),
          BoldText(
            text: value,
            fontSize: TextStyles.k18FontSize,
            color: kColorTitle,
          ),
          AppText(
            text: label,
            fontSize: TextStyles.k12FontSize,
            color: kColorTextSecondary,
            maxLines: 2,
          ),
        ],
      ),
    );
  }
}
