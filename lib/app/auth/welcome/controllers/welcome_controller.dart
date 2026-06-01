import 'package:doctors_clinic/constants/string_constants.dart';
import 'package:doctors_clinic/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WelcomeController extends GetxController {
  void onLoginToClinic() {
    _showNextScreenMessage(kLoginToClinicButton, Routes.AUTH_LOGIN);
  }

  void onOpenNewClinic() {
    _showNextScreenMessage(kOpenNewClinicButton, Routes.OPEN_NEW_CLINIC);
  }

  void _showNextScreenMessage(String screenName, String routeName) {
    Get.snackbar(
      screenName,
      'This screen is next in the build plan ($routeName).',
      snackPosition: SnackPosition.BOTTOM,
      margin: const EdgeInsets.all(16),
      duration: const Duration(seconds: 2),
    );
  }
}
