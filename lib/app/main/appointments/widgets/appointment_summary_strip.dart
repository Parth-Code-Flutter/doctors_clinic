import 'package:doctors_clinic/constants/color_constants.dart';
import 'package:doctors_clinic/constants/string_constants.dart';
import 'package:doctors_clinic/utils/text_utils/app_text.dart';
import 'package:doctors_clinic/utils/text_utils/text_styles.dart';
import 'package:flutter/material.dart';

class AppointmentSummaryStrip extends StatelessWidget {
  const AppointmentSummaryStrip({
    required this.todayCount,
    required this.upcomingCount,
    super.key,
  });

  final int todayCount;
  final int upcomingCount;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _SummaryCard(
            label: kAppointmentsSummaryToday,
            value: todayCount.toString(),
            icon: Icons.today_rounded,
            iconColor: kColorLink,
            background: kColorSecondaryButtonBackground,
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: _SummaryCard(
            label: kAppointmentsSummaryUpcoming,
            value: upcomingCount.toString(),
            icon: Icons.event_available_rounded,
            iconColor: kColorAppointmentPending,
            background: const Color(0xFFFEF3C7),
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
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: kColorBorder),
      ),
      child: Row(
        children: [
          Icon(icon, color: iconColor, size: 22),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BoldText(
                  text: value,
                  fontSize: TextStyles.k20FontSize,
                  color: kColorTitle,
                ),
                AppText(
                  text: label,
                  fontSize: TextStyles.k12FontSize,
                  color: kColorTextSecondary,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
