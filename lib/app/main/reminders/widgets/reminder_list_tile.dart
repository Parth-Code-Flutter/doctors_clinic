import 'package:doctors_clinic/app/main/patients/widgets/patient_avatar.dart';
import 'package:doctors_clinic/app/main/reminders/models/reminder_model.dart';
import 'package:doctors_clinic/app/main/reminders/models/reminder_status.dart';
import 'package:doctors_clinic/app/main/reminders/utils/reminder_format_utils.dart';
import 'package:doctors_clinic/app/main/reminders/widgets/reminder_status_chip.dart';
import 'package:doctors_clinic/constants/color_constants.dart';
import 'package:doctors_clinic/constants/string_constants.dart';
import 'package:doctors_clinic/utils/text_utils/app_text.dart';
import 'package:doctors_clinic/utils/text_utils/text_styles.dart';
import 'package:flutter/material.dart';

class ReminderListTileCard extends StatelessWidget {
  const ReminderListTileCard({
    required this.reminder,
    required this.onTap,
    this.onRetry,
    super.key,
  });

  final ReminderModel reminder;
  final VoidCallback onTap;
  final VoidCallback? onRetry;

  @override
  Widget build(BuildContext context) {
    final initials = reminder.patientName.trim().isEmpty
        ? '?'
        : reminder.patientName
              .trim()
              .split(RegExp(r'\s+'))
              .map((p) => p[0])
              .take(2)
              .join()
              .toUpperCase();

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(18),
        child: Ink(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: kColorSurface,
            borderRadius: BorderRadius.circular(18),
            border: Border.all(
              color: reminder.status == ReminderStatus.failed
                  ? kColorAppointmentMissed.withValues(alpha: 0.45)
                  : reminder.isDeliverToday
                  ? kColorLink
                  : kColorBorder,
              width: reminder.isDeliverToday ? 1.2 : 1,
            ),
            boxShadow: const [
              BoxShadow(
                color: kColorCardShadow,
                blurRadius: 10,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PatientAvatar(
                    initials: initials.length > 2
                        ? initials.substring(0, 2)
                        : initials,
                    colorIndex: reminder.patientName.hashCode,
                    size: 42,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: SemiBoldText(
                                text: reminder.patientName,
                                fontSize: TextStyles.k14FontSize,
                                color: kColorTitle,
                                maxLines: 1,
                              ),
                            ),
                            ReminderStatusChip(status: reminder.status),
                          ],
                        ),
                        const SizedBox(height: 4),
                        AppText(
                          text: reminder.patientPhone,
                          fontSize: TextStyles.k12FontSize,
                          color: kColorTextSecondary,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              _InfoLine(
                icon: Icons.notifications_active_outlined,
                label: kRemindersDeliverLabel,
                value: ReminderFormatUtils.formatDateTime(reminder.deliverAt),
              ),
              const SizedBox(height: 6),
              _InfoLine(
                icon: Icons.event_rounded,
                label: kRemindersVisitLabel,
                value:
                    '${ReminderFormatUtils.formatDateTime(reminder.appointmentAt)} · ${reminder.timingLabel}',
              ),
              const SizedBox(height: 6),
              AppText(
                text:
                    '${reminder.channelLabel} $kRemindersChannelPrefix ${reminder.timingLabel}',
                fontSize: TextStyles.k12FontSize,
                color: kColorTextSecondary,
              ),
              if (reminder.failureMessage != null &&
                  reminder.failureMessage!.isNotEmpty) ...[
                const SizedBox(height: 8),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFEF2F2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: AppText(
                    text: reminder.failureMessage!,
                    fontSize: TextStyles.k12FontSize,
                    color: kColorAppointmentMissed,
                    maxLines: 2,
                  ),
                ),
              ],
              if (reminder.status == ReminderStatus.failed &&
                  onRetry != null) ...[
                const SizedBox(height: 10),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton.icon(
                    onPressed: onRetry,
                    icon: const Icon(Icons.refresh_rounded, size: 18),
                    label: const Text(kRemindersRetryButton),
                    style: TextButton.styleFrom(foregroundColor: kColorLink),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class _InfoLine extends StatelessWidget {
  const _InfoLine({
    required this.icon,
    required this.label,
    required this.value,
  });

  final IconData icon;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 16, color: kColorTextSecondary),
        const SizedBox(width: 8),
        Expanded(
          child: RichText(
            text: TextSpan(
              style: const TextStyle(
                fontSize: TextStyles.k12FontSize,
                color: kColorTextSecondary,
                height: 1.35,
              ),
              children: [
                TextSpan(
                  text: '$label · ',
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
                TextSpan(text: value),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
