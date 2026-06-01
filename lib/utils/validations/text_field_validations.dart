import 'package:doctors_clinic/constants/string_constants.dart';

/// Form validators for clinic auth and setup flows.
class Validate {
  Validate._();

  static final RegExp _emailPattern = RegExp(
    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
  );

  static String? requiredText(String? value, String message) {
    if ((value ?? '').trim().isEmpty) {
      return message;
    }
    return null;
  }

  static String? emailValidation(String? value) {
    final email = (value ?? '').trim();
    if (email.isEmpty) {
      return kValidationEmailRequired;
    }
    if (!_emailPattern.hasMatch(email)) {
      return kValidationEmailInvalid;
    }
    return null;
  }

  static String? emailOrPhoneValidation(String? value) {
    final input = (value ?? '').trim();
    if (input.isEmpty) {
      return kValidationUsernameRequired;
    }
    if (RegExp(r'^\d+$').hasMatch(input)) {
      return mobile10DigitValidation(input);
    }
    return emailValidation(input);
  }

  static String? mobile10DigitValidation(String? value) {
    final mobile = (value ?? '').trim();
    if (mobile.isEmpty) {
      return kValidationMobileRequired;
    }
    if (!RegExp(r'^\d{10}$').hasMatch(mobile)) {
      return kValidationMobileInvalid;
    }
    return null;
  }

  static String? passwordValidation(String value) {
    if (value.trim().isEmpty) {
      return kValidationPasswordRequired;
    }
    if (value.trim().length < 6) {
      return kValidationPasswordMinLength;
    }
    return null;
  }

  static String? confirmPasswordValidation(String password, String? confirm) {
    final confirmed = (confirm ?? '').trim();
    if (confirmed.isEmpty) {
      return kValidationConfirmPasswordRequired;
    }
    if (confirmed != password.trim()) {
      return kValidationPasswordMismatch;
    }
    return null;
  }

  static String? otpValidation(String? value) {
    final otp = (value ?? '').trim();
    if (otp.isEmpty) {
      return kValidationOtpRequired;
    }
    if (!RegExp(r'^\d{6}$').hasMatch(otp)) {
      return kValidationOtpInvalid;
    }
    return null;
  }
}
