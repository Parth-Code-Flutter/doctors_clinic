import 'package:doctors_clinic/constants/color_constants.dart';
import 'package:doctors_clinic/constants/string_constants.dart';
import 'package:doctors_clinic/utils/text_utils/app_text.dart';
import 'package:doctors_clinic/utils/text_utils/text_styles.dart';
import 'package:flutter/material.dart';

class DashboardHeroHeader extends StatelessWidget {
  const DashboardHeroHeader({
    required this.greeting,
    required this.ownerName,
    required this.clinicName,
    required this.dateLabel,
    super.key,
  });

  final String greeting;
  final String ownerName;
  final String clinicName;
  final String dateLabel;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 8, 20, 0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [kColorPrimary, kColorDashboardGradientEnd],
        ),
        boxShadow: const [
          BoxShadow(
            color: kColorCardShadow,
            blurRadius: 24,
            offset: Offset(0, 12),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: Stack(
          children: [
            Positioned(
              top: -28,
              right: -20,
              child: Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: kColorLogoIcon.withValues(alpha: 0.22),
                ),
              ),
            ),
            Positioned(
              bottom: -36,
              left: -24,
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white.withValues(alpha: 0.06),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 22, 20, 22),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppText(
                              text: greeting,
                              fontSize: TextStyles.k14FontSize,
                              color: Colors.white.withValues(alpha: 0.82),
                            ),
                            const SizedBox(height: 4),
                            BoldText(
                              text: ownerName,
                              fontSize: TextStyles.k24FontSize,
                              color: kColorOnPrimary,
                            ),
                            const SizedBox(height: 6),
                            SemiBoldText(
                              text: clinicName,
                              fontSize: TextStyles.k14FontSize,
                              color: kColorLogoIcon,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.14),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: Colors.white.withValues(alpha: 0.2),
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              width: 8,
                              height: 8,
                              decoration: const BoxDecoration(
                                color: kColorAppointmentSuccess,
                                shape: BoxShape.circle,
                              ),
                            ),
                            const SizedBox(width: 6),
                            AppText(
                              text: kDashboardClinicOpenBadge,
                              fontSize: TextStyles.k12FontSize,
                              color: kColorOnPrimary,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.12),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.calendar_today_rounded,
                          size: 16,
                          color: Colors.white.withValues(alpha: 0.9),
                        ),
                        const SizedBox(width: 8),
                        SemiBoldText(
                          text: dateLabel,
                          fontSize: TextStyles.k12FontSize,
                          color: kColorOnPrimary,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
