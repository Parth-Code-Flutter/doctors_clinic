import 'package:doctors_clinic/app/main/appointments/models/appointment_status.dart';
import 'package:doctors_clinic/utils/text_utils/app_text.dart';
import 'package:doctors_clinic/utils/text_utils/text_styles.dart';
import 'package:flutter/material.dart';

class AppointmentStatusChip extends StatelessWidget {
  const AppointmentStatusChip({required this.status, super.key});

  final AppointmentStatus status;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: status.backgroundColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: SemiBoldText(
        text: status.label,
        fontSize: TextStyles.k12FontSize,
        color: status.color,
      ),
    );
  }
}
