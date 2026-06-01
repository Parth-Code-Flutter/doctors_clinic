import 'package:doctors_clinic/app/main/patients/data/patient_repository.dart';
import 'package:doctors_clinic/app/main/patients/models/patient_gender.dart';
import 'package:doctors_clinic/app/main/patients/models/patient_model.dart';
import 'package:doctors_clinic/app/main/patients/widgets/quick_age_chips.dart';
import 'package:doctors_clinic/constants/string_constants.dart';
import 'package:doctors_clinic/utils/validations/text_field_validations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddPatientController extends GetxController {
  static const int totalSteps = 3;

  final stepFormKeys = List.generate(totalSteps, (_) => GlobalKey<FormState>());
  final pageController = PageController();

  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final ageController = TextEditingController();
  final addressController = TextEditingController();
  final notesController = TextEditingController();

  final currentStep = 0.obs;
  final selectedGender = PatientGender.notSpecified.obs;
  final selectedQuickAge = Rxn<int>();
  final isSaving = false.obs;

  PatientRepository get _repo => Get.find<PatientRepository>();

  String get currentTip {
    switch (currentStep.value) {
      case 0:
        return kAddPatientTipName;
      case 1:
        return kAddPatientTipAge;
      case 2:
      default:
        return kAddPatientTipNotes;
    }
  }

  String get stepTitle {
    switch (currentStep.value) {
      case 0:
        return kAddPatientStepBasicsTitle;
      case 1:
        return kAddPatientStepPersonalTitle;
      case 2:
      default:
        return kAddPatientStepOptionalTitle;
    }
  }

  String get stepSubtitle {
    switch (currentStep.value) {
      case 0:
        return kAddPatientStepBasicsSubtitle;
      case 1:
        return kAddPatientStepPersonalSubtitle;
      case 2:
      default:
        return kAddPatientStepOptionalSubtitle;
    }
  }

  String get primaryButtonLabel {
    if (currentStep.value < totalSteps - 1) {
      return kAddPatientContinue;
    }
    return kAddPatientSave;
  }

  bool get canGoBack => currentStep.value > 0;

  @override
  void onClose() {
    pageController.dispose();
    nameController.dispose();
    phoneController.dispose();
    ageController.dispose();
    addressController.dispose();
    notesController.dispose();
    super.onClose();
  }

  void onGenderSelected(PatientGender gender) {
    selectedGender.value = gender;
  }

  void onQuickAgeSelected(int age) {
    selectedQuickAge.value = age;
    ageController.text = age.toString();
  }

  void onAgeChanged(String value) {
    final parsed = int.tryParse(value.trim());
    if (parsed != null &&
        QuickAgeChips.defaults.any((chip) => chip.age == parsed)) {
      selectedQuickAge.value = parsed;
    } else {
      selectedQuickAge.value = null;
    }
  }

  Future<void> onPrimaryAction() async {
    if (!_validateCurrentStep()) {
      return;
    }

    if (currentStep.value < totalSteps - 1) {
      _goToStep(currentStep.value + 1);
      return;
    }

    await _savePatient();
  }

  void onBack() {
    if (currentStep.value > 0) {
      _goToStep(currentStep.value - 1);
    } else {
      Get.back();
    }
  }

  Future<void> onSkipAndSave() async {
    if (!_validateStepsThrough(1)) {
      return;
    }
    await _savePatient();
  }

  String? validateName(String? value) => Validate.patientNameValidation(value);
  String? validatePhone(String? value) => Validate.mobile10DigitValidation(value);
  String? validateAge(String? value) => Validate.optionalAgeValidation(value);

  bool _validateCurrentStep() => _validateStep(currentStep.value);

  bool _validateStep(int step) {
    return stepFormKeys[step].currentState?.validate() ?? false;
  }

  bool _validateStepsThrough(int lastStep) {
    for (var i = 0; i <= lastStep; i++) {
      if (!_validateStep(i)) {
        _goToStep(i);
        return false;
      }
    }
    return true;
  }

  void _goToStep(int step) {
    currentStep.value = step;
    pageController.animateToPage(
      step,
      duration: const Duration(milliseconds: 280),
      curve: Curves.easeOutCubic,
    );
  }

  Future<void> _savePatient() async {
    if (isSaving.value) {
      return;
    }

    try {
      isSaving.value = true;
      await Future<void>.delayed(const Duration(milliseconds: 500));

      final ageText = ageController.text.trim();
      final age = ageText.isEmpty ? null : int.tryParse(ageText);

      final patient = PatientModel(
        id: 'p-${DateTime.now().millisecondsSinceEpoch}',
        fullName: nameController.text.trim(),
        phone: phoneController.text.trim(),
        gender: selectedGender.value,
        age: age,
        address: addressController.text.trim().isEmpty
            ? null
            : addressController.text.trim(),
        notes: notesController.text.trim().isEmpty
            ? null
            : notesController.text.trim(),
        createdAt: DateTime.now(),
      );

      _repo.addPatient(patient);

      Get.back(result: true);
      Get.snackbar(
        kAddPatientTitle,
        kAddPatientSuccess,
        snackPosition: SnackPosition.BOTTOM,
        margin: const EdgeInsets.all(16),
        duration: const Duration(seconds: 2),
      );
    } finally {
      isSaving.value = false;
    }
  }
}
