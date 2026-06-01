import 'package:doctors_clinic/app/auth/auth_route_arguments.dart';
import 'package:doctors_clinic/routes/app_pages.dart';
import 'package:doctors_clinic/utils/validations/text_field_validations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPasswordController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final contactController = TextEditingController();
  final isLoading = false.obs;

  @override
  void onClose() {
    contactController.dispose();
    super.onClose();
  }

  String? validateContact(String? value) => Validate.emailOrPhoneValidation(value);

  bool get _isPhoneContact {
    final trimmed = contactController.text.trim();
    return trimmed.isNotEmpty && RegExp(r'^\d+$').hasMatch(trimmed);
  }

  Future<void> onSendOtp() async {
    if (isLoading.value || !(formKey.currentState?.validate() ?? false)) {
      return;
    }

    try {
      isLoading.value = true;
      await Future<void>.delayed(const Duration(milliseconds: 500));
      final contact = contactController.text.trim();
      Get.offNamed(
        Routes.AUTH_OTP_VERIFICATION,
        arguments: {
          AuthRouteArgs.otpFlow: AuthOtpFlow.forgotPassword.name,
          AuthRouteArgs.contact: contact,
          AuthRouteArgs.isPhone: _isPhoneContact,
        },
      );
    } finally {
      isLoading.value = false;
    }
  }
}
