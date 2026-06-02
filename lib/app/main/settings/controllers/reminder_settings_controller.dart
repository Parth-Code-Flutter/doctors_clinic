import 'package:doctors_clinic/app/main/settings/data/clinic_settings_repository.dart';
import 'package:doctors_clinic/constants/string_constants.dart';
import 'package:doctors_clinic/utils/ui_utils/app_toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReminderSettingsController extends GetxController {
  final selectedReminderIndex = 2.obs;
  final selectedChannelIndex = 0.obs;
  final autoRemindersEnabled = true.obs;
  final isSaving = false.obs;

  ClinicSettingsRepository get _repo => Get.find<ClinicSettingsRepository>();

  @override
  void onInit() {
    super.onInit();
    final s = _repo.settings.value;
    selectedReminderIndex.value = s.defaultReminderIndex;
    selectedChannelIndex.value = s.reminderChannelIndex;
    autoRemindersEnabled.value = s.autoRemindersEnabled;
  }

  void onReminderChanged(int? index) {
    if (index != null) {
      selectedReminderIndex.value = index;
    }
  }

  void onChannelChanged(int? index) {
    if (index != null) {
      selectedChannelIndex.value = index;
    }
  }

  void onAutoRemindersChanged(bool value) {
    autoRemindersEnabled.value = value;
  }

  Future<void> onSave() async {
    if (isSaving.value) {
      return;
    }

    try {
      isSaving.value = true;
      await Future<void>.delayed(const Duration(milliseconds: 400));
      _repo.updateReminders(
        defaultReminderIndex: selectedReminderIndex.value,
        reminderChannelIndex: selectedChannelIndex.value,
        autoRemindersEnabled: autoRemindersEnabled.value,
      );
      Get.back();
      showAppToast(
        kSettingsRemindersScreenTitle,
        kSettingsRemindersSavedMessage,
        snackPosition: SnackPosition.BOTTOM,
        margin: const EdgeInsets.all(16),
        duration: const Duration(seconds: 3),
      );
    } finally {
      isSaving.value = false;
    }
  }
}
