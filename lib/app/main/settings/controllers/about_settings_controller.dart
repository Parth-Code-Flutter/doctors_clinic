import 'package:doctors_clinic/constants/string_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AboutSettingsController extends GetxController {
  void onSupportTap() {
    Get.snackbar(
      kSettingsSupportTitle,
      kSettingsSupportEmail,
      snackPosition: SnackPosition.BOTTOM,
      margin: const EdgeInsets.all(16),
      duration: const Duration(seconds: 4),
    );
  }

  void onLegalTap(String title) {
    Get.snackbar(
      title,
      kSettingsLegalPendingMessage,
      snackPosition: SnackPosition.BOTTOM,
      margin: const EdgeInsets.all(16),
      duration: const Duration(seconds: 3),
    );
  }
}
