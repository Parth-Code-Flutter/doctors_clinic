import 'package:doctors_clinic/constants/string_constants.dart';
import 'package:doctors_clinic/routes/app_pages.dart';
import 'package:doctors_clinic/utils/validations/text_field_validations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OpenNewClinicController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final clinicNameController = TextEditingController();
  final ownerNameController = TextEditingController();
  final mobileController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  final isPasswordHidden = true.obs;
  final isConfirmPasswordHidden = true.obs;
  final isRegisterLoading = false.obs;

  @override
  void onClose() {
    clinicNameController.dispose();
    ownerNameController.dispose();
    mobileController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }

  void togglePasswordVisibility() {
    isPasswordHidden.value = !isPasswordHidden.value;
  }

  void toggleConfirmPasswordVisibility() {
    isConfirmPasswordHidden.value = !isConfirmPasswordHidden.value;
  }

  String? validateClinicName(String? value) =>
      Validate.requiredText(value, kValidationClinicNameRequired);

  String? validateOwnerName(String? value) =>
      Validate.requiredText(value, kValidationOwnerNameRequired);

  String? validateMobile(String? value) =>
      Validate.mobile10DigitValidation(value);

  String? validateEmail(String? value) => Validate.emailValidation(value);

  String? validatePassword(String? value) =>
      Validate.passwordValidation(value ?? '');

  String? validateConfirmPassword(String? value) =>
      Validate.confirmPasswordValidation(passwordController.text, value);

  bool validateForm() => formKey.currentState?.validate() ?? false;

  Future<void> onRegisterPressed() async {
    if (isRegisterLoading.value || !validateForm()) {
      return;
    }

    try {
      isRegisterLoading.value = true;
      // Clinic registration API (`POST /auth/register-clinic`) — v0.2.
      await Future<void>.delayed(const Duration(milliseconds: 600));
      Get.offNamed(Routes.CLINIC_SETUP);
    } finally {
      isRegisterLoading.value = false;
    }
  }

  void onLoginToClinic() {
    // Replace register route so the login Form GlobalKey is not duplicated on stack.
    Get.offNamed(Routes.AUTH_LOGIN);
  }
}
