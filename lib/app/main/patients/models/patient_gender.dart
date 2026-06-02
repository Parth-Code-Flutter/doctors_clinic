import 'package:doctors_clinic/constants/string_constants.dart';
import 'package:flutter/material.dart';

enum PatientGender { male, female, other, notSpecified }

extension PatientGenderX on PatientGender {
  String get label {
    switch (this) {
      case PatientGender.male:
        return kPatientGenderMale;
      case PatientGender.female:
        return kPatientGenderFemale;
      case PatientGender.other:
        return kPatientGenderOther;
      case PatientGender.notSpecified:
        return kPatientGenderNotSpecified;
    }
  }

  IconData get icon {
    switch (this) {
      case PatientGender.male:
        return Icons.male_rounded;
      case PatientGender.female:
        return Icons.female_rounded;
      case PatientGender.other:
        return Icons.transgender_rounded;
      case PatientGender.notSpecified:
        return Icons.person_outline_rounded;
    }
  }

  String get storageValue {
    switch (this) {
      case PatientGender.male:
        return 'male';
      case PatientGender.female:
        return 'female';
      case PatientGender.other:
        return 'other';
      case PatientGender.notSpecified:
        return 'not_specified';
    }
  }

  static PatientGender fromStorage(String? value) {
    switch (value) {
      case 'male':
        return PatientGender.male;
      case 'female':
        return PatientGender.female;
      case 'other':
        return PatientGender.other;
      default:
        return PatientGender.notSpecified;
    }
  }
}
