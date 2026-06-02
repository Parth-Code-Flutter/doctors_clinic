import 'package:doctors_clinic/constants/string_constants.dart';
import 'package:doctors_clinic/utils/ui_utils/app_toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AboutSettingsController extends GetxController {
  void onSupportTap() {
    showAppToast(
      kSettingsSupportTitle,
      kSettingsSupportEmail,
      snackPosition: SnackPosition.BOTTOM,
      margin: const EdgeInsets.all(16),
      duration: const Duration(seconds: 4),
    );
  }

  void onLegalTap(String title) {
    showAppToast(
      title,
      kSettingsLegalPendingMessage,
      snackPosition: SnackPosition.BOTTOM,
      margin: const EdgeInsets.all(16),
      duration: const Duration(seconds: 3),
    );
  }
}
