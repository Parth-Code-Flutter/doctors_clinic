import 'package:doctors_clinic/app/main/dashboard/models/dashboard_appointment_item.dart';
import 'package:doctors_clinic/app/main/dashboard/models/dashboard_appointment_status.dart';
import 'package:doctors_clinic/constants/color_constants.dart';
import 'package:doctors_clinic/utils/text_utils/app_text.dart';
import 'package:doctors_clinic/utils/text_utils/text_styles.dart';
import 'package:flutter/material.dart';

class DashboardAppointmentCard extends StatelessWidget {
  const DashboardAppointmentCard({
    required this.item,
    required this.onTap,
    super.key,
  });

  final DashboardAppointmentItem item;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final status = item.status;

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
            border: Border.all(color: kColorBorder),
            boxShadow: const [
              BoxShadow(
                color: kColorCardShadow,
                blurRadius: 12,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            children: [
              Container(
                width: 54,
                padding: const EdgeInsets.symmetric(vertical: 8),
                decoration: BoxDecoration(
                  color: kColorBackground,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    Icon(Icons.schedule_rounded, size: 16, color: kColorLink),
                    const SizedBox(height: 4),
                    SemiBoldText(
                      text: item.timeLabel,
                      fontSize: TextStyles.k12FontSize,
                      color: kColorTitle,
                      align: TextAlign.center,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SemiBoldText(
                      text: item.patientName,
                      fontSize: TextStyles.k16FontSize,
                      color: kColorTitle,
                    ),
                    const SizedBox(height: 4),
                    AppText(
                      text: item.serviceLabel,
                      fontSize: TextStyles.k12FontSize,
                      color: kColorTextSecondary,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: status.backgroundColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: SemiBoldText(
                  text: status.label,
                  fontSize: TextStyles.k12FontSize,
                  color: status.color,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
