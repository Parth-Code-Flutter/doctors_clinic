import 'package:doctors_clinic/app/main/settings/data/clinic_settings_repository.dart';
import 'package:doctors_clinic/app/main/settings/widgets/settings_clinic_hero_card.dart';
import 'package:doctors_clinic/app/main/settings/widgets/settings_menu_tile.dart';
import 'package:doctors_clinic/app/main/settings/widgets/settings_section_header.dart';
import 'package:doctors_clinic/constants/color_constants.dart';
import 'package:doctors_clinic/constants/string_constants.dart';
import 'package:doctors_clinic/utils/app_widgets/app_button.dart'
    show AppButtonVariant, appButton;
import 'package:doctors_clinic/utils/app_widgets/common_app_bar_widget.dart';
import 'package:doctors_clinic/utils/text_utils/app_text.dart';
import 'package:doctors_clinic/utils/text_utils/text_styles.dart';
import 'package:doctors_clinic/utils/ui_utils/app_ui_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/more_tab_controller.dart';

class MoreTabView extends GetView<MoreTabController> {
  const MoreTabView({super.key});

  @override
  Widget build(BuildContext context) {
    final settingsRepo = Get.find<ClinicSettingsRepository>();

    return Scaffold(
      backgroundColor: kColorBackground,
      appBar: const CommonAppBarWidget(
        title: kMoreTitle,
        showBackButton: false,
      ),
      body: Obx(() {
        final settings = settingsRepo.settings.value;
        return ListView(
          padding: AppUIUtils.horizontalPadding.copyWith(top: 4, bottom: 24),
          children: [
            const AppText(
              text: kMoreSubtitle,
              fontSize: TextStyles.k14FontSize,
              color: kColorTextSecondary,
            ),
            const SizedBox(height: 16),
            SettingsClinicHeroCard(settings: settings),
            const SettingsSectionHeader(title: kSettingsSectionClinic),
            SettingsMenuTile(
              icon: Icons.storefront_outlined,
              title: kSettingsClinicProfileTitle,
              subtitle: kSettingsClinicProfileSubtitle,
              onTap: controller.onClinicProfile,
            ),
            const SettingsSectionHeader(title: kSettingsSectionReminders),
            SettingsMenuTile(
              icon: Icons.people_alt_outlined,
              title: kQueueMenuTitle,
              subtitle: kQueueMenuSubtitle,
              onTap: controller.onQueue,
            ),
            const SizedBox(height: 10),
            SettingsMenuTile(
              icon: Icons.sms_outlined,
              title: kRemindersListMenuTitle,
              subtitle: kRemindersListMenuSubtitle,
              onTap: controller.onRemindersList,
            ),
            const SizedBox(height: 10),
            SettingsMenuTile(
              icon: Icons.chat_outlined,
              title: kWhatsAppMenuTitle,
              subtitle: kWhatsAppMenuSubtitle,
              onTap: controller.onWhatsApp,
            ),
            const SizedBox(height: 10),
            SettingsMenuTile(
              icon: Icons.receipt_long_outlined,
              title: kBillingMenuTitle,
              subtitle: kBillingMenuSubtitle,
              onTap: controller.onBilling,
            ),
            const SizedBox(height: 10),
            SettingsMenuTile(
              icon: Icons.event_repeat_outlined,
              title: kFollowUpMenuTitle,
              subtitle: kFollowUpMenuSubtitle,
              onTap: controller.onFollowUps,
            ),
            const SizedBox(height: 10),
            SettingsMenuTile(
              icon: Icons.groups_2_outlined,
              title: kStaffMenuTitle,
              subtitle: kStaffMenuSubtitle,
              onTap: controller.onStaff,
            ),
            const SizedBox(height: 10),
            SettingsMenuTile(
              icon: Icons.badge_outlined,
              title: kDoctorMenuTitle,
              subtitle: kDoctorMenuSubtitle,
              onTap: controller.onDoctors,
            ),
            const SizedBox(height: 10),
            SettingsMenuTile(
              icon: Icons.insights_outlined,
              title: kReportsMenuTitle,
              subtitle: kReportsMenuSubtitle,
              onTap: controller.onReports,
            ),
            const SizedBox(height: 10),
            SettingsMenuTile(
              icon: Icons.tune_rounded,
              title: kSettingsRemindersTitle,
              subtitle: controller.reminderMenuSubtitle,
              onTap: controller.onReminderSettings,
            ),
            const SizedBox(height: 10),
            SettingsMenuTile(
              icon: Icons.manage_accounts_outlined,
              title: kSettingsAccountTitle,
              subtitle: kSettingsAccountSubtitle,
              onTap: controller.onAccount,
            ),
            const SettingsSectionHeader(title: kSettingsSectionSupport),
            SettingsMenuTile(
              icon: Icons.info_outline_rounded,
              title: kSettingsAboutTitle,
              subtitle: kSettingsAboutSubtitle,
              onTap: controller.onAbout,
            ),
            const SizedBox(height: 24),
            appButton(
              onPressed: controller.onLogout,
              buttonText: kMoreLogoutButton,
              variant: AppButtonVariant.secondary,
              buttonIcon: const Icon(Icons.logout_rounded, size: 20),
            ),
          ],
        );
      }),
    );
  }
}
