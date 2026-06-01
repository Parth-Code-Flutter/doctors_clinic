import 'package:doctors_clinic/constants/color_constants.dart';
import 'package:doctors_clinic/constants/string_constants.dart';
import 'package:doctors_clinic/utils/text_utils/app_text.dart';
import 'package:doctors_clinic/utils/text_utils/text_styles.dart';
import 'package:flutter/material.dart';

class AddPatientStepHeader extends StatelessWidget {
  const AddPatientStepHeader({
    required this.currentStep,
    required this.totalSteps,
    required this.title,
    required this.subtitle,
    required this.tip,
    super.key,
  });

  final int currentStep;
  final int totalSteps;
  final String title;
  final String subtitle;
  final String tip;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: List.generate(totalSteps, (index) {
            final isActive = index <= currentStep;
            final isCurrent = index == currentStep;
            return Expanded(
              child: Padding(
                padding: EdgeInsets.only(right: index < totalSteps - 1 ? 6 : 0),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 220),
                  height: 4,
                  decoration: BoxDecoration(
                    color: isActive ? kColorLogoIcon : kColorBorder,
                    borderRadius: BorderRadius.circular(4),
                    boxShadow: isCurrent
                        ? [
                            BoxShadow(
                              color: kColorLogoIcon.withValues(alpha: 0.35),
                              blurRadius: 6,
                            ),
                          ]
                        : null,
                  ),
                ),
              ),
            );
          }),
        ),
        const SizedBox(height: 6),
        AppText(
          text: '$kAddPatientTitle · ${currentStep + 1}/$totalSteps',
          fontSize: TextStyles.k12FontSize,
          color: kColorTextSecondary,
        ),
        const SizedBox(height: 12),
        BoldText(
          text: title,
          fontSize: TextStyles.k20FontSize,
          color: kColorTitle,
        ),
        const SizedBox(height: 6),
        AppText(
          text: subtitle,
          fontSize: TextStyles.k14FontSize,
          color: kColorTextSecondary,
        ),
      ],
    );
  }
}
