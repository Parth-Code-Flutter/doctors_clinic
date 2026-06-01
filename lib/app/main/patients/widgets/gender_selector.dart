import 'package:doctors_clinic/app/main/patients/models/patient_gender.dart';
import 'package:doctors_clinic/constants/color_constants.dart';
import 'package:doctors_clinic/utils/text_utils/app_text.dart';
import 'package:doctors_clinic/utils/text_utils/text_styles.dart';
import 'package:flutter/material.dart';

class GenderSelector extends StatelessWidget {
  const GenderSelector({
    required this.selected,
    required this.onSelected,
    super.key,
  });

  final PatientGender selected;
  final ValueChanged<PatientGender> onSelected;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10,
      runSpacing: 10,
      children: PatientGender.values.map((gender) {
        final isSelected = selected == gender;
        return Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () => onSelected(gender),
            borderRadius: BorderRadius.circular(16),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 180),
              width: (MediaQuery.sizeOf(context).width - 60) / 2,
              padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 12),
              decoration: BoxDecoration(
                color: isSelected
                    ? kColorSecondaryButtonBackground
                    : kColorSurface,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: isSelected ? kColorLink : kColorBorder,
                  width: isSelected ? 1.5 : 1,
                ),
              ),
              child: Column(
                children: [
                  Icon(
                    gender.icon,
                    color: isSelected ? kColorLink : kColorTextSecondary,
                    size: 28,
                  ),
                  const SizedBox(height: 6),
                  SemiBoldText(
                    text: gender.label,
                    fontSize: TextStyles.k12FontSize,
                    color: isSelected ? kColorLink : kColorTitle,
                    align: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
