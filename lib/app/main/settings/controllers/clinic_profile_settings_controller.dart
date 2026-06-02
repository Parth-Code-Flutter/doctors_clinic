import 'package:doctors_clinic/app/main/settings/data/clinic_settings_model.dart';
import 'package:doctors_clinic/app/main/settings/data/clinic_settings_repository.dart';
import 'package:doctors_clinic/constants/string_constants.dart';
import 'package:doctors_clinic/utils/ui_utils/app_toast.dart';
import 'package:doctors_clinic/utils/validations/text_field_validations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ClinicProfileSettingsController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final clinicNameController = TextEditingController();
  final ownerNameController = TextEditingController();
  final mobileController = TextEditingController();
  final emailController = TextEditingController();
  final addressController = TextEditingController();
  final cityController = TextEditingController();
  final stateController = TextEditingController();
  final pincodeController = TextEditingController();
  final clinicTypeController = TextEditingController();
  final workingDaysController = TextEditingController();
  final workingHoursController = TextEditingController();

  final isSaving = false.obs;

  ClinicSettingsRepository get _repo => Get.find<ClinicSettingsRepository>();

  @override
  void onInit() {
    super.onInit();
    _loadFromRepository();
  }

  @override
  void onClose() {
    clinicNameController.dispose();
    ownerNameController.dispose();
    mobileController.dispose();
    emailController.dispose();
    addressController.dispose();
    cityController.dispose();
    stateController.dispose();
    pincodeController.dispose();
    clinicTypeController.dispose();
    workingDaysController.dispose();
    workingHoursController.dispose();
    super.onClose();
  }

  void _loadFromRepository() {
    final s = _repo.settings.value;
    clinicNameController.text = s.clinicName;
    ownerNameController.text = s.ownerName;
    mobileController.text = s.mobile;
    emailController.text = s.email;
    addressController.text = s.address;
    cityController.text = s.city;
    stateController.text = s.state;
    pincodeController.text = s.pincode;
    clinicTypeController.text = s.clinicType;
    workingDaysController.text = s.workingDays;
    workingHoursController.text = s.workingHours;
  }

  Future<void> onSave() async {
    if (isSaving.value || !(formKey.currentState?.validate() ?? false)) {
      return;
    }

    try {
      isSaving.value = true;
      await Future<void>.delayed(const Duration(milliseconds: 500));

      final updated = ClinicSettingsModel(
        clinicName: clinicNameController.text.trim(),
        ownerName: ownerNameController.text.trim(),
        mobile: mobileController.text.trim(),
        email: emailController.text.trim(),
        address: addressController.text.trim(),
        city: cityController.text.trim(),
        state: stateController.text.trim(),
        pincode: pincodeController.text.trim(),
        clinicType: clinicTypeController.text.trim(),
        workingDays: workingDaysController.text.trim(),
        workingHours: workingHoursController.text.trim(),
        defaultReminderIndex: _repo.settings.value.defaultReminderIndex,
        reminderChannelIndex: _repo.settings.value.reminderChannelIndex,
        autoRemindersEnabled: _repo.settings.value.autoRemindersEnabled,
      );

      _repo.updateProfile(updated);
      Get.back();
      showAppToast(
        kSettingsClinicProfileScreenTitle,
        kSettingsProfileSavedMessage,
        snackPosition: SnackPosition.BOTTOM,
        margin: const EdgeInsets.all(16),
        duration: const Duration(seconds: 3),
      );
    } finally {
      isSaving.value = false;
    }
  }

  String? validateClinicName(String? value) =>
      Validate.requiredText(value, kValidationClinicNameRequired);

  String? validateOwnerName(String? value) =>
      Validate.requiredText(value, kValidationOwnerNameRequired);

  String? validateMobile(String? value) =>
      Validate.mobile10DigitValidation(value);

  String? validateEmail(String? value) => Validate.emailValidation(value);
}
