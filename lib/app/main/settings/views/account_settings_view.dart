import 'package:doctors_clinic/app/main/settings/controllers/account_settings_controller.dart';
import 'package:doctors_clinic/app/main/settings/widgets/settings_menu_tile.dart';
import 'package:doctors_clinic/constants/color_constants.dart';
import 'package:doctors_clinic/constants/string_constants.dart';
import 'package:doctors_clinic/utils/app_widgets/app_button.dart'
    show AppButtonVariant, appButton;
import 'package:doctors_clinic/utils/app_widgets/app_spaces.dart';
import 'package:doctors_clinic/utils/app_widgets/common_app_bar_widget.dart';
import 'package:doctors_clinic/utils/text_utils/app_text.dart';
import 'package:doctors_clinic/utils/text_utils/text_styles.dart';
import 'package:doctors_clinic/utils/ui_utils/app_ui_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AccountSettingsView extends GetView<AccountSettingsController> {
  const AccountSettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kColorBackground,
      appBar: const CommonAppBarWidget(title: kSettingsAccountScreenTitle),
      body: ListView(
        padding: AppUIUtils.horizontalPadding.copyWith(top: 8, bottom: 24),
        children: [
          const AppText(
            text: kSettingsAccountScreenSubtitle,
            fontSize: TextStyles.k14FontSize,
            color: kColorTextSecondary,
          ),
          Spacing.v20,
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: kColorSurface,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: kColorBorder),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const AppText(
                  text: kSettingsSignedInAs,
                  fontSize: TextStyles.k12FontSize,
                  color: kColorTextSecondary,
                ),
                const SizedBox(height: 6),
                SemiBoldText(
                  text: controller.accountEmail,
                  fontSize: TextStyles.k16FontSize,
                  color: kColorTitle,
                ),
              ],
            ),
          ),
          Spacing.v16,
          SettingsMenuTile(
            icon: Icons.lock_outline_rounded,
            title: kSettingsChangePassword,
            subtitle: kSettingsChangePasswordSubtitle,
            onTap: controller.onChangePassword,
          ),
          Spacing.v24,
          appButton(
            onPressed: controller.onLogout,
            buttonText: kSettingsLogoutTitle,
            variant: AppButtonVariant.secondary,
            buttonIcon: const Icon(Icons.logout_rounded, size: 20),
          ),
        ],
      ),
    );
  }
}
