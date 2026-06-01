import 'package:doctors_clinic/constants/color_constants.dart';
import 'package:doctors_clinic/utils/text_utils/app_text.dart';
import 'package:doctors_clinic/utils/text_utils/text_styles.dart';
import 'package:flutter/material.dart';

class QuickTimeSlot {
  const QuickTimeSlot({required this.label, required this.hour, required this.minute});

  final String label;
  final int hour;
  final int minute;
}

class QuickTimeSlotChips extends StatelessWidget {
  const QuickTimeSlotChips({
    required this.slots,
    required this.selectedHour,
    required this.selectedMinute,
    required this.onSelected,
    super.key,
  });

  final List<QuickTimeSlot> slots;
  final int? selectedHour;
  final int? selectedMinute;
  final ValueChanged<QuickTimeSlot> onSelected;

  static List<QuickTimeSlot> clinicDefaults() {
    return const [
      QuickTimeSlot(label: '9:00 AM', hour: 9, minute: 0),
      QuickTimeSlot(label: '9:30 AM', hour: 9, minute: 30),
      QuickTimeSlot(label: '10:00 AM', hour: 10, minute: 0),
      QuickTimeSlot(label: '10:30 AM', hour: 10, minute: 30),
      QuickTimeSlot(label: '11:00 AM', hour: 11, minute: 0),
      QuickTimeSlot(label: '12:00 PM', hour: 12, minute: 0),
      QuickTimeSlot(label: '2:00 PM', hour: 14, minute: 0),
      QuickTimeSlot(label: '3:00 PM', hour: 15, minute: 0),
      QuickTimeSlot(label: '4:00 PM', hour: 16, minute: 0),
      QuickTimeSlot(label: '5:00 PM', hour: 17, minute: 0),
      QuickTimeSlot(label: '6:00 PM', hour: 18, minute: 0),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: slots.length,
        separatorBuilder: (_, __) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          final slot = slots[index];
          final selected =
              selectedHour == slot.hour && selectedMinute == slot.minute;
          return FilterChip(
            label: AppText(
              text: slot.label,
              fontSize: TextStyles.k12FontSize,
              color: selected ? kColorLink : kColorTitle,
            ),
            selected: selected,
            onSelected: (_) => onSelected(slot),
            showCheckmark: false,
            selectedColor: kColorSecondaryButtonBackground,
            backgroundColor: kColorSurface,
            side: BorderSide(color: selected ? kColorLink : kColorBorder),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          );
        },
      ),
    );
  }
}
