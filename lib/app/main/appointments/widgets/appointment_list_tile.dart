import 'package:doctors_clinic/app/main/appointments/models/appointment_model.dart';
import 'package:doctors_clinic/app/main/appointments/models/appointment_status.dart';
import 'package:doctors_clinic/app/main/appointments/utils/appointment_format_utils.dart';
import 'package:doctors_clinic/app/main/appointments/widgets/appointment_status_chip.dart';
import 'package:doctors_clinic/app/main/patients/widgets/patient_avatar.dart';
import 'package:doctors_clinic/constants/color_constants.dart';
import 'package:doctors_clinic/utils/text_utils/app_text.dart';
import 'package:doctors_clinic/utils/text_utils/text_styles.dart';
import 'package:flutter/material.dart';

class AppointmentListTileCard extends StatelessWidget {
  const AppointmentListTileCard({
    required this.appointment,
    required this.onTap,
    super.key,
  });

  final AppointmentModel appointment;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final time = AppointmentFormatUtils.formatTime(appointment.scheduledAt);
    final initials = appointment.patientName.trim().isEmpty
        ? '?'
        : appointment.patientName
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
              color: appointment.isToday ? kColorLink : kColorBorder,
              width: appointment.isToday ? 1.2 : 1,
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
              Container(
                width: 58,
                padding: const EdgeInsets.symmetric(vertical: 8),
                decoration: BoxDecoration(
                  color: kColorBackground,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Column(
                  children: [
                    Icon(
                      Icons.schedule_rounded,
                      size: 18,
                      color: appointment.status.color,
                    ),
                    const SizedBox(height: 4),
                    SemiBoldText(
                      text: time,
                      fontSize: TextStyles.k12FontSize,
                      color: kColorTitle,
                      align: TextAlign.center,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              PatientAvatar(
                initials: initials.length > 2
                    ? initials.substring(0, 2)
                    : initials,
                colorIndex: appointment.patientName.hashCode,
                size: 40,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SemiBoldText(
                      text: appointment.patientName,
                      fontSize: TextStyles.k16FontSize,
                      color: kColorTitle,
                    ),
                    const SizedBox(height: 4),
                    AppText(
                      text: appointment.reason ?? 'General visit',
                      fontSize: TextStyles.k12FontSize,
                      color: kColorTextSecondary,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    AppText(
                      text: appointment.patientPhone,
                      fontSize: TextStyles.k12FontSize,
                      color: kColorTextSecondary,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              AppointmentStatusChip(status: appointment.status),
            ],
          ),
        ),
      ),
    );
  }
}
