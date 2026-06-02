import 'package:doctors_clinic/constants/string_constants.dart';
import 'package:doctors_clinic/routes/app_pages.dart';
import 'package:doctors_clinic/utils/ui_utils/app_toast.dart';
import 'package:doctors_clinic/utils/validations/text_field_validations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPasswordController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  final isPasswordHidden = true.obs;
  final isConfirmPasswordHidden = true.obs;
  final isLoading = false.obs;

  @override
  void onClose() {
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

  String? validatePassword(String? value) =>
      Validate.passwordValidation(value ?? '');

  String? validateConfirmPassword(String? value) =>
      Validate.confirmPasswordValidation(passwordController.text, value);

  Future<void> onUpdatePassword() async {
    if (isLoading.value || !(formKey.currentState?.validate() ?? false)) {
      return;
    }

    try {
      isLoading.value = true;
      await Future<void>.delayed(const Duration(milliseconds: 500));
      showAppToast(
        kResetPasswordTitle,
        kForgotPasswordApiPendingMessage,
        snackPosition: SnackPosition.BOTTOM,
        margin: const EdgeInsets.all(16),
        duration: const Duration(seconds: 2),
      );
      Get.offAllNamed(Routes.AUTH_LOGIN);
    } finally {
      isLoading.value = false;
    }
  }
}
