import 'package:doctors_clinic/constants/string_constants.dart';
import 'package:doctors_clinic/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ClinicSetupController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final addressController = TextEditingController();
  final cityController = TextEditingController();
  final stateController = TextEditingController();
  final pincodeController = TextEditingController();
  final clinicTypeController = TextEditingController();
  final workingDaysController = TextEditingController();
  final workingHoursController = TextEditingController();

  final selectedReminderIndex = 2.obs;
  final isLoading = false.obs;

  @override
  void onClose() {
    addressController.dispose();
    cityController.dispose();
    stateController.dispose();
    pincodeController.dispose();
    clinicTypeController.dispose();
    workingDaysController.dispose();
    workingHoursController.dispose();
    super.onClose();
  }

  void onReminderChanged(int? index) {
    if (index != null) {
      selectedReminderIndex.value = index;
    }
  }

  Future<void> onSaveSetup() async {
    if (isLoading.value) {
      return;
    }

    try {
      isLoading.value = true;
      await Future<void>.delayed(const Duration(milliseconds: 600));
      Get.snackbar(
        kClinicSetupTitle,
        kClinicSetupSuccessMessage,
        snackPosition: SnackPosition.BOTTOM,
        margin: const EdgeInsets.all(16),
        duration: const Duration(seconds: 3),
      );
      // Auth flow complete — return to login until main app shell exists.
      Get.offAllNamed(Routes.AUTH_LOGIN);
    } finally {
      isLoading.value = false;
    }
  }

  void onSkipSetup() {
    Get.offAllNamed(Routes.AUTH_LOGIN);
  }
}
