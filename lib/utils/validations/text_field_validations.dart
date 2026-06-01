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
}
