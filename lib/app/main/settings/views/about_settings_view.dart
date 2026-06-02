import 'package:doctors_clinic/app/main/settings/controllers/about_settings_controller.dart';
import 'package:doctors_clinic/app/main/settings/widgets/settings_menu_tile.dart';
import 'package:doctors_clinic/constants/color_constants.dart';
import 'package:doctors_clinic/constants/string_constants.dart';
import 'package:doctors_clinic/utils/app_widgets/app_clinic_logo.dart';
import 'package:doctors_clinic/utils/app_widgets/app_spaces.dart';
import 'package:doctors_clinic/utils/app_widgets/common_app_bar_widget.dart';
import 'package:doctors_clinic/utils/text_utils/app_text.dart';
import 'package:doctors_clinic/utils/text_utils/text_styles.dart';
import 'package:doctors_clinic/utils/ui_utils/app_ui_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AboutSettingsView extends GetView<AboutSettingsController> {
  const AboutSettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kColorBackground,
      appBar: const CommonAppBarWidget(title: kSettingsAboutScreenTitle),
      body: ListView(
        padding: AppUIUtils.horizontalPadding.copyWith(top: 8, bottom: 24),
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: kColorSurface,
              borderRadius: BorderRadius.circular(18),
              border: Border.all(color: kColorBorder),
            ),
            child: Column(
              children: [
                const AppClinicLogo(
                  size: 64,
                  iconSize: 32,
                  borderRadius: 18,
                  showShadow: false,
                ),
                Spacing.v12,
                const BoldText(
                  text: kAppName,
                  fontSize: TextStyles.k20FontSize,
                  color: kColorTitle,
                ),
                const SizedBox(height: 4),
                const AppText(
                  text: kAppTagline,
                  fontSize: TextStyles.k12FontSize,
                  color: kColorTextSecondary,
                  align: TextAlign.center,
                ),
                Spacing.v12,
                const AppText(
                  text: '$kSettingsAppVersionLabel · $kSettingsAppVersion',
                  fontSize: TextStyles.k12FontSize,
                  color: kColorTextSecondary,
                ),
              ],
            ),
          ),
          Spacing.v16,
          SettingsMenuTile(
            icon: Icons.support_agent_outlined,
            title: kSettingsSupportTitle,
            subtitle: kSettingsSupportEmail,
            onTap: controller.onSupportTap,
          ),
          const SizedBox(height: 10),
          SettingsMenuTile(
            icon: Icons.privacy_tip_outlined,
            title: kSettingsPrivacyTitle,
            onTap: () => controller.onLegalTap(kSettingsPrivacyTitle),
          ),
          const SizedBox(height: 10),
          SettingsMenuTile(
            icon: Icons.description_outlined,
            title: kSettingsTermsTitle,
            onTap: () => controller.onLegalTap(kSettingsTermsTitle),
          ),
        ],
      ),
    );
  }
}
