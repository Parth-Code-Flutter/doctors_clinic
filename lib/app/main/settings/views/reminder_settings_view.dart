import 'package:doctors_clinic/app/main/settings/controllers/reminder_settings_controller.dart';
import 'package:doctors_clinic/constants/color_constants.dart';
import 'package:doctors_clinic/constants/string_constants.dart';
import 'package:doctors_clinic/utils/app_widgets/app_button.dart';
import 'package:doctors_clinic/utils/app_widgets/app_drop_down.dart';
import 'package:doctors_clinic/utils/app_widgets/app_spaces.dart';
import 'package:doctors_clinic/utils/app_widgets/common_app_bar_widget.dart';
import 'package:doctors_clinic/utils/text_utils/app_text.dart';
import 'package:doctors_clinic/utils/text_utils/text_styles.dart';
import 'package:doctors_clinic/utils/ui_utils/app_ui_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReminderSettingsView extends GetView<ReminderSettingsController> {
  const ReminderSettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kColorBackground,
      appBar: const CommonAppBarWidget(title: kSettingsRemindersScreenTitle),
      body: ListView(
        padding: AppUIUtils.horizontalPadding.copyWith(top: 8, bottom: 24),
        children: [
          const AppText(
            text: kSettingsRemindersScreenSubtitle,
            fontSize: TextStyles.k14FontSize,
            color: kColorTextSecondary,
          ),
          Spacing.v16,
          Obx(
            () => AppDropDown<int>(
              value: controller.selectedReminderIndex.value,
              hint: kDefaultReminderHint,
              items: List.generate(
                kDefaultReminderOptions.length,
                (index) => DropdownMenuItem<int>(
                  value: index,
                  child: Text(kDefaultReminderOptions[index]),
                ),
              ),
              onChanged: controller.onReminderChanged,
            ),
          ),
          Spacing.v12,
          Obx(
            () => AppDropDown<int>(
              value: controller.selectedChannelIndex.value,
              hint: kSettingsReminderChannelHint,
              items: List.generate(
                kReminderChannelOptions.length,
                (index) => DropdownMenuItem<int>(
                  value: index,
                  child: Text(kReminderChannelOptions[index]),
                ),
              ),
              onChanged: controller.onChannelChanged,
            ),
          ),
          Spacing.v16,
          _AutoRemindersCard(controller: controller),
          Spacing.v12,
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: kColorSecondaryButtonBackground,
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: const Color(0xFFA5F3FC)),
            ),
            child: const Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.info_outline_rounded, size: 20, color: kColorLink),
                SizedBox(width: 10),
                Expanded(
                  child: AppText(
                    text: kSettingsRemindersApiNote,
                    fontSize: TextStyles.k12FontSize,
                    color: kColorTextSecondary,
                  ),
                ),
              ],
            ),
          ),
          Spacing.v20,
          Obx(
            () => appButton(
              onPressed: controller.onSave,
              buttonText: kSettingsSaveRemindersButton,
              isLoading: controller.isSaving.value,
            ),
          ),
        ],
      ),
    );
  }
}

class _AutoRemindersCard extends StatelessWidget {
  const _AutoRemindersCard({required this.controller});

  final ReminderSettingsController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
        decoration: BoxDecoration(
          color: kColorSurface,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: kColorBorder),
        ),
        child: SwitchListTile(
          contentPadding: EdgeInsets.zero,
          value: controller.autoRemindersEnabled.value,
          onChanged: controller.onAutoRemindersChanged,
          title: const SemiBoldText(
            text: kSettingsAutoRemindersTitle,
            fontSize: TextStyles.k14FontSize,
            color: kColorTitle,
          ),
          subtitle: const AppText(
            text: kSettingsAutoRemindersSubtitle,
            fontSize: TextStyles.k12FontSize,
            color: kColorTextSecondary,
          ),
        ),
      ),
    );
  }
}
