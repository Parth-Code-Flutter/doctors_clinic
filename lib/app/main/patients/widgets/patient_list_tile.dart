import 'package:doctors_clinic/app/main/patients/models/patient_gender.dart';
import 'package:doctors_clinic/app/main/patients/models/patient_model.dart';
import 'package:doctors_clinic/app/main/patients/widgets/patient_avatar.dart';
import 'package:doctors_clinic/constants/color_constants.dart';
import 'package:doctors_clinic/constants/string_constants.dart';
import 'package:doctors_clinic/utils/text_utils/app_text.dart';
import 'package:doctors_clinic/utils/text_utils/text_styles.dart';
import 'package:flutter/material.dart';

class PatientListTileCard extends StatelessWidget {
  const PatientListTileCard({
    required this.patient,
    required this.onTap,
    this.isNew = false,
    super.key,
  });

  final PatientModel patient;
  final VoidCallback onTap;
  final bool isNew;

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
            border: Border.all(color: kColorBorder),
            boxShadow: const [
              BoxShadow(
                color: kColorCardShadow,
                blurRadius: 10,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            children: [
              PatientAvatar(
                initials: patient.initials,
                colorIndex: patient.avatarColorIndex,
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
                            text: patient.fullName,
                            fontSize: TextStyles.k16FontSize,
                            color: kColorTitle,
                          ),
                        ),
                        if (isNew)
                          _Badge(
                            label: kPatientsNewBadge,
                            color: kColorLink,
                            background: kColorSecondaryButtonBackground,
                          ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    AppText(
                      text: patient.phone,
                      fontSize: TextStyles.k14FontSize,
                      color: kColorTextSecondary,
                    ),
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: 6,
                      runSpacing: 6,
                      children: [
                        _Badge(
                          label: patient.gender.label,
                          color: kColorTextSecondary,
                          background: kColorBackground,
                        ),
                        if (patient.age != null)
                          _Badge(
                            label: '${patient.age} yrs',
                            color: kColorTextSecondary,
                            background: kColorBackground,
                          ),
                        if (patient.hasUpcomingVisit)
                          const _Badge(
                            label: kPatientsNextVisit,
                            color: kColorLink,
                            background: kColorSecondaryButtonBackground,
                          ),
                      ],
                    ),
                  ],
                ),
              ),
              const Icon(
                Icons.chevron_right_rounded,
                color: kColorTextSecondary,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Badge extends StatelessWidget {
  const _Badge({
    required this.label,
    required this.color,
    required this.background,
  });

  final String label;
  final Color color;
  final Color background;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(8),
      ),
      child: AppText(
        text: label,
        fontSize: TextStyles.k12FontSize,
        color: color,
      ),
    );
  }
}
