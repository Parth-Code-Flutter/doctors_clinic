import 'package:doctors_clinic/app/auth/auth_route_arguments.dart';
import 'package:doctors_clinic/constants/string_constants.dart';
import 'package:doctors_clinic/routes/app_pages.dart';
import 'package:doctors_clinic/utils/validations/text_field_validations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthLoginController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final emailOrPhoneController = TextEditingController();
  final passwordController = TextEditingController();

  final isPasswordHidden = true.obs;
  final isLoginLoading = false.obs;
  final isPhoneInput = false.obs;

  @override
  void onClose() {
    emailOrPhoneController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  void togglePasswordVisibility() {
    isPasswordHidden.value = !isPasswordHidden.value;
  }

  void onUsernameChanged(String value) {
    final trimmed = value.trimLeft();
    if (trimmed.isEmpty) {
      isPhoneInput.value = false;
      return;
    }
    isPhoneInput.value = RegExp(r'^\d$').hasMatch(trimmed[0]);
  }

  String? validateUsername(String? value) {
    final username = (value ?? '').trim();
    if (username.isEmpty) {
      return kValidationUsernameRequired;
    }
    if (isPhoneInput.value) {
      if (!RegExp(r'^\d{10}$').hasMatch(username)) {
        return kValidationEmailOrPhoneInvalid;
      }
      return null;
    }
    final emailPattern = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );
    if (!emailPattern.hasMatch(username)) {
      return kValidationEmailOrPhoneInvalid;
    }
    return null;
  }

  String? validatePassword(String? value) {
    return Validate.passwordValidation(value ?? '');
  }

  bool validateForm() => formKey.currentState?.validate() ?? false;

  Future<void> onLoginPressed() async {
    if (isLoginLoading.value || !validateForm()) {
      return;
    }

    try {
      isLoginLoading.value = true;
      await Future<void>.delayed(const Duration(milliseconds: 600));
      Get.offNamed(Routes.CLINIC_SETUP);
    } finally {
      isLoginLoading.value = false;
    }
  }

  void onForgotPassword() {
    Get.toNamed(Routes.AUTH_FORGOT_PASSWORD);
  }

  void onLoginWithOtp() {
    final contact = emailOrPhoneController.text.trim();
    final error = validateUsername(contact);
    if (error != null) {
      Get.snackbar(
        kLoginWithOtp,
        error,
        snackPosition: SnackPosition.BOTTOM,
        margin: const EdgeInsets.all(16),
        duration: const Duration(seconds: 2),
      );
      return;
    }

    Get.toNamed(
      Routes.AUTH_OTP_VERIFICATION,
      arguments: {
        AuthRouteArgs.otpFlow: AuthOtpFlow.login.name,
        AuthRouteArgs.contact: contact,
        AuthRouteArgs.isPhone: isPhoneInput.value,
      },
    );
  }

  void onOpenNewClinic() {
    Get.offNamed(Routes.OPEN_NEW_CLINIC);
  }
}
