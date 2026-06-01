import 'package:doctors_clinic/constants/string_constants.dart';

/// Form validators for clinic auth and setup flows.
class Validate {
  Validate._();

  static String? passwordValidation(String value) {
    if (value.trim().isEmpty) {
      return kValidationPasswordRequired;
    }
    return null;
  }
}
