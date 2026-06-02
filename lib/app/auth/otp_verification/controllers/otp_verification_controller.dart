import 'dart:async';

import 'package:doctors_clinic/app/auth/auth_route_arguments.dart';
import 'package:doctors_clinic/constants/string_constants.dart';
import 'package:doctors_clinic/routes/app_pages.dart';
import 'package:doctors_clinic/utils/ui_utils/app_toast.dart';
import 'package:doctors_clinic/utils/validations/text_field_validations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OtpVerificationController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final otpController = TextEditingController();

  final isLoading = false.obs;
  final resendSeconds = 0.obs;

  late AuthOtpFlow _flow;
  String _contact = '';
  Timer? _resendTimer;

  @override
  void onInit() {
    super.onInit();
    _readArguments();
    if (!Get.testMode) {
      _startResendTimer();
    }
  }

  @override
  void onClose() {
    otpController.dispose();
    _resendTimer?.cancel();
    super.onClose();
  }

  void _readArguments() {
    final args = Get.arguments;
    if (args is Map) {
      final flowName = args[AuthRouteArgs.otpFlow] as String?;
      _flow = AuthOtpFlow.values.firstWhere(
        (e) => e.name == flowName,
        orElse: () => AuthOtpFlow.login,
      );
      _contact = args[AuthRouteArgs.contact] as String? ?? '';
    } else {
      _flow = AuthOtpFlow.login;
    }
  }

  String get contactLabel =>
      _contact.isEmpty ? 'your registered contact' : _contact;

  String get resendTimerLabel {
    final mins = resendSeconds.value ~/ 60;
    final secs = resendSeconds.value % 60;
    return '${mins.toString().padLeft(2, '0')}:${secs.toString().padLeft(2, '0')}';
  }

  bool get canResend => resendSeconds.value == 0;

  String? validateOtp(String? value) => Validate.otpValidation(value);

  void _startResendTimer({int seconds = 60}) {
    _resendTimer?.cancel();
    resendSeconds.value = seconds;
    _resendTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (resendSeconds.value <= 0) {
        timer.cancel();
        return;
      }
      resendSeconds.value--;
    });
  }

  Future<void> onResendOtp() async {
    if (!canResend) {
      return;
    }
    showAppToast(
      kResendOtp,
      kOtpApiPendingMessage,
      snackPosition: SnackPosition.BOTTOM,
      margin: const EdgeInsets.all(16),
      duration: const Duration(seconds: 2),
    );
    _startResendTimer();
  }

  Future<void> onVerifyOtp() async {
    if (isLoading.value || !(formKey.currentState?.validate() ?? false)) {
      return;
    }

    try {
      isLoading.value = true;
      await Future<void>.delayed(const Duration(milliseconds: 500));

      switch (_flow) {
        case AuthOtpFlow.forgotPassword:
          Get.offNamed(Routes.AUTH_RESET_PASSWORD);
          break;
        case AuthOtpFlow.login:
        case AuthOtpFlow.register:
          Get.offNamed(Routes.CLINIC_SETUP);
          break;
      }
    } finally {
      isLoading.value = false;
    }
  }
}
