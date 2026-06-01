import 'package:doctors_clinic/app/main/patients/models/patient_model.dart';
import 'package:doctors_clinic/app/main/patients/widgets/patient_avatar.dart';
import 'package:doctors_clinic/constants/color_constants.dart';
import 'package:doctors_clinic/utils/text_utils/app_text.dart';
import 'package:doctors_clinic/utils/text_utils/text_styles.dart';
import 'package:flutter/material.dart';

class PatientPickerTile extends StatelessWidget {
  const PatientPickerTile({
    required this.patient,
    required this.selected,
    required this.onTap,
    super.key,
  });

  final PatientModel patient;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Ink(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          decoration: BoxDecoration(
            color: selected ? kColorSecondaryButtonBackground : kColorSurface,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: selected ? kColorLink : kColorBorder,
              width: selected ? 1.5 : 1,
            ),
          ),
          child: Row(
            children: [
              PatientAvatar(
                initials: patient.initials,
                colorIndex: patient.avatarColorIndex,
                size: 40,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SemiBoldText(
                      text: patient.fullName,
                      fontSize: TextStyles.k14FontSize,
                      color: kColorTitle,
                    ),
                    AppText(
                      text: patient.phone,
                      fontSize: TextStyles.k12FontSize,
                      color: kColorTextSecondary,
                    ),
                  ],
                ),
              ),
              if (selected)
                const Icon(Icons.check_circle_rounded, color: kColorLink)
              else
                const Icon(
                  Icons.radio_button_unchecked_rounded,
                  color: kColorBorder,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
