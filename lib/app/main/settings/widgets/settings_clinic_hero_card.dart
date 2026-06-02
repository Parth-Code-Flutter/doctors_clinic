import 'package:doctors_clinic/app/main/settings/data/clinic_settings_model.dart';
import 'package:doctors_clinic/constants/color_constants.dart';
import 'package:doctors_clinic/utils/app_widgets/app_clinic_logo.dart';
import 'package:doctors_clinic/utils/text_utils/app_text.dart';
import 'package:doctors_clinic/utils/text_utils/text_styles.dart';
import 'package:flutter/material.dart';

class SettingsClinicHeroCard extends StatelessWidget {
  const SettingsClinicHeroCard({super.key, required this.settings});

  final ClinicSettingsModel settings;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [kColorPrimary, kColorDashboardGradientEnd],
        ),
        borderRadius: BorderRadius.circular(22),
        boxShadow: const [
          BoxShadow(
            color: kColorCardShadow,
            blurRadius: 18,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const AppClinicLogo(
                size: 52,
                iconSize: 28,
                borderRadius: 14,
                showShadow: false,
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BoldText(
                      text: settings.clinicName,
                      fontSize: TextStyles.k18FontSize,
                      color: kColorOnPrimary,
                      maxLines: 2,
                    ),
                    const SizedBox(height: 4),
                    AppText(
                      text: settings.ownerName,
                      fontSize: TextStyles.k14FontSize,
                      color: Colors.white.withValues(alpha: 0.88),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          _HeroLine(
            icon: Icons.phone_outlined,
            text: settings.mobile,
          ),
          if (settings.locationLine.isNotEmpty) ...[
            const SizedBox(height: 6),
            _HeroLine(
              icon: Icons.location_on_outlined,
              text: settings.locationLine,
            ),
          ],
        ],
      ),
    );
  }
}

class _HeroLine extends StatelessWidget {
  const _HeroLine({required this.icon, required this.text});

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 16, color: Colors.white.withValues(alpha: 0.75)),
        const SizedBox(width: 8),
        Expanded(
          child: AppText(
            text: text,
            fontSize: TextStyles.k12FontSize,
            color: Colors.white.withValues(alpha: 0.9),
            maxLines: 2,
          ),
        ),
      ],
    );
  }
}
