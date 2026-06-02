import 'package:doctors_clinic/constants/color_constants.dart';
import 'package:doctors_clinic/constants/string_constants.dart';
import 'package:doctors_clinic/utils/text_utils/app_text.dart';
import 'package:doctors_clinic/utils/text_utils/text_styles.dart';
import 'package:flutter/material.dart';

class QueueSummaryStrip extends StatelessWidget {
  const QueueSummaryStrip({
    required this.waitingCount,
    required this.withDoctorCount,
    required this.completedCount,
    required this.skippedCount,
    super.key,
  });

  final int waitingCount;
  final int withDoctorCount;
  final int completedCount;
  final int skippedCount;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _SummaryCard(
            label: kQueueSummaryWaiting,
            value: waitingCount.toString(),
            icon: Icons.hourglass_top_rounded,
            iconColor: kColorAppointmentPending,
            background: const Color(0xFFFEF3C7),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: _SummaryCard(
            label: kQueueSummaryInConsultation,
            value: withDoctorCount.toString(),
            icon: Icons.local_hospital_rounded,
            iconColor: kColorLink,
            background: kColorSecondaryButtonBackground,
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: _SummaryCard(
            label: kQueueSummaryCompleted,
            value: completedCount.toString(),
            icon: Icons.check_circle_rounded,
            iconColor: kColorAppointmentSuccess,
            background: const Color(0xFFDCFCE7),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: _SummaryCard(
            label: kQueueSummarySkipped,
            value: skippedCount.toString(),
            icon: Icons.block_rounded,
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
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: kColorBorder),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 18, color: iconColor),
          const SizedBox(height: 4),
          BoldText(
            text: value,
            fontSize: TextStyles.k16FontSize,
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
