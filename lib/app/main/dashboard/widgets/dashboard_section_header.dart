import 'package:doctors_clinic/constants/color_constants.dart';
import 'package:doctors_clinic/constants/string_constants.dart';
import 'package:doctors_clinic/utils/text_utils/app_text.dart';
import 'package:doctors_clinic/utils/text_utils/text_styles.dart';
import 'package:flutter/material.dart';

class DashboardSectionHeader extends StatelessWidget {
  const DashboardSectionHeader({
    required this.title,
    this.actionLabel,
    this.onActionTap,
    super.key,
  });

  final String title;
  final String? actionLabel;
  final VoidCallback? onActionTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 24, 20, 12),
      child: Row(
        children: [
          Expanded(
            child: BoldText(
              text: title,
              fontSize: TextStyles.k18FontSize,
              color: kColorTitle,
            ),
          ),
          if (actionLabel != null && onActionTap != null)
            GestureDetector(
              onTap: onActionTap,
              child: SemiBoldText(
                text: actionLabel!,
                fontSize: TextStyles.k14FontSize,
                color: kColorLink,
              ),
            ),
        ],
      ),
    );
  }
}

class DashboardEmptySchedule extends StatelessWidget {
  const DashboardEmptySchedule({
    required this.onBookTap,
    super.key,
  });

  final VoidCallback onBookTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: kColorSurface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: kColorBorder),
      ),
      child: Column(
        children: [
          Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              color: kColorSecondaryButtonBackground,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.event_busy_rounded,
              size: 32,
              color: kColorLink,
            ),
          ),
          const SizedBox(height: 16),
          const BoldText(
            text: kDashboardEmptyAppointmentsTitle,
            fontSize: TextStyles.k16FontSize,
            color: kColorTitle,
            align: TextAlign.center,
          ),
          const SizedBox(height: 8),
          const AppText(
            text: kDashboardEmptyAppointmentsSubtitle,
            fontSize: TextStyles.k14FontSize,
            color: kColorTextSecondary,
            align: TextAlign.center,
          ),
          const SizedBox(height: 16),
          TextButton.icon(
            onPressed: onBookTap,
            icon: const Icon(Icons.add_circle_outline, color: kColorLink),
            label: const SemiBoldText(
              text: kDashboardBookFirstAppointment,
              fontSize: TextStyles.k14FontSize,
              color: kColorLink,
            ),
          ),
        ],
      ),
    );
  }
}
