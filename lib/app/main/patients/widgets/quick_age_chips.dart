import 'package:doctors_clinic/constants/color_constants.dart';
import 'package:doctors_clinic/constants/string_constants.dart';
import 'package:doctors_clinic/utils/text_utils/app_text.dart';
import 'package:doctors_clinic/utils/text_utils/text_styles.dart';
import 'package:flutter/material.dart';

class QuickAgeChipData {
  const QuickAgeChipData({required this.label, required this.age});

  final String label;
  final int age;
}

class QuickAgeChips extends StatelessWidget {
  const QuickAgeChips({
    required this.chips,
    required this.selectedAge,
    required this.onSelected,
    super.key,
  });

  final List<QuickAgeChipData> chips;
  final int? selectedAge;
  final ValueChanged<int> onSelected;

  static List<QuickAgeChipData> get defaults => const [
    QuickAgeChipData(label: kPatientQuickAgeChild, age: 10),
    QuickAgeChipData(label: kPatientQuickAgeYoung, age: 25),
    QuickAgeChipData(label: kPatientQuickAgeMid, age: 35),
    QuickAgeChipData(label: kPatientQuickAgeSenior, age: 55),
  ];

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: chips.map((chip) {
        final isSelected = selectedAge == chip.age;
        return FilterChip(
          label: AppText(
            text: chip.label,
            fontSize: TextStyles.k12FontSize,
            color: isSelected ? kColorLink : kColorTitle,
          ),
          selected: isSelected,
          onSelected: (_) => onSelected(chip.age),
          showCheckmark: false,
          selectedColor: kColorSecondaryButtonBackground,
          backgroundColor: kColorSurface,
          side: BorderSide(color: isSelected ? kColorLink : kColorBorder),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        );
      }).toList(),
    );
  }
}
