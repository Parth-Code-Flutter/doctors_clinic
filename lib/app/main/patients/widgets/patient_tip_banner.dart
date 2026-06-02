import 'package:doctors_clinic/constants/color_constants.dart';
import 'package:doctors_clinic/utils/text_utils/app_text.dart';
import 'package:doctors_clinic/utils/text_utils/text_styles.dart';
import 'package:flutter/material.dart';

class PatientTipBanner extends StatelessWidget {
  const PatientTipBanner({required this.message, super.key});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: kColorSecondaryButtonBackground,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFFA5F3FC)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(
            Icons.lightbulb_outline_rounded,
            size: 20,
            color: kColorLink,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: AppText(
              text: message,
              fontSize: TextStyles.k12FontSize,
              color: kColorSecondaryButtonText,
            ),
          ),
        ],
      ),
    );
  }
}
