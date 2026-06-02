import 'package:doctors_clinic/app/main/patients/widgets/patient_avatar.dart';
import 'package:doctors_clinic/app/main/queue/models/queue_token_model.dart';
import 'package:doctors_clinic/app/main/queue/widgets/queue_status_chip.dart';
import 'package:doctors_clinic/constants/color_constants.dart';
import 'package:doctors_clinic/constants/string_constants.dart';
import 'package:doctors_clinic/utils/text_utils/app_text.dart';
import 'package:doctors_clinic/utils/text_utils/text_styles.dart';
import 'package:flutter/material.dart';

class QueueTokenTile extends StatelessWidget {
  const QueueTokenTile({required this.token, required this.onTap, super.key});

  final QueueTokenModel token;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
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
              color: token.isPriority ? kColorAppointmentPending : kColorBorder,
              width: token.isPriority ? 1.2 : 1,
            ),
            boxShadow: const [
              BoxShadow(
                color: kColorCardShadow,
                blurRadius: 10,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _TokenPill(
                number: token.tokenNumber,
                isPriority: token.isPriority,
              ),
              const SizedBox(width: 12),
              PatientAvatar(
                initials: token.patientName.isEmpty
                    ? '?'
                    : token.patientName
                          .trim()
                          .split(RegExp(r'\s+'))
                          .map((p) => p[0])
                          .take(2)
                          .join()
                          .toUpperCase(),
                colorIndex: token.patientName.hashCode,
                size: 42,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: SemiBoldText(
                            text: token.patientName,
                            fontSize: TextStyles.k14FontSize,
                            color: kColorTitle,
                            maxLines: 1,
                          ),
                        ),
                        QueueStatusChip(status: token.status),
                      ],
                    ),
                    const SizedBox(height: 4),
                    AppText(
                      text: token.patientPhone,
                      fontSize: TextStyles.k12FontSize,
                      color: kColorTextSecondary,
                    ),
                    if (token.reason != null && token.reason!.isNotEmpty) ...[
                      const SizedBox(height: 6),
                      AppText(
                        text: token.reason!,
                        fontSize: TextStyles.k12FontSize,
                        color: kColorTextSecondary,
                        maxLines: 2,
                      ),
                    ],
                    if (token.isPriority) ...[
                      const SizedBox(height: 6),
                      const AppText(
                        text: kQueuePriorityLabel,
                        fontSize: TextStyles.k12FontSize,
                        color: kColorAppointmentPending,
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _TokenPill extends StatelessWidget {
  const _TokenPill({required this.number, required this.isPriority});

  final int number;
  final bool isPriority;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 54,
      padding: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: isPriority ? const Color(0xFFFEF3C7) : kColorBackground,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          const AppText(
            text: kQueueTokenShort,
            fontSize: TextStyles.k12FontSize,
            color: kColorTextSecondary,
          ),
          BoldText(
            text: number.toString(),
            fontSize: TextStyles.k18FontSize,
            color: kColorTitle,
          ),
        ],
      ),
    );
  }
}
