import 'package:doctors_clinic/app/main/patients/data/patient_repository.dart';
import 'package:doctors_clinic/app/main/patients/models/patient_gender.dart';
import 'package:doctors_clinic/app/main/patients/models/patient_model.dart';
import 'package:doctors_clinic/app/main/patients/patient_route_arguments.dart';
import 'package:doctors_clinic/app/main/patients/widgets/quick_age_chips.dart';
import 'package:doctors_clinic/constants/string_constants.dart';
import 'package:doctors_clinic/utils/validations/text_field_validations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditPatientController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final ageController = TextEditingController();
  final addressController = TextEditingController();
  final notesController = TextEditingController();

  final selectedGender = PatientGender.notSpecified.obs;
  final selectedQuickAge = Rxn<int>();
  final isSaving = false.obs;

  late String _patientId;
  PatientModel? _original;

  PatientRepository get _repo => Get.find<PatientRepository>();

  @override
  void onInit() {
    super.onInit();
    _patientId = Get.arguments?[PatientRouteArgs.patientId] as String? ?? '';
    _loadPatient();
  }

  @override
  void onClose() {
    nameController.dispose();
    phoneController.dispose();
    ageController.dispose();
    addressController.dispose();
    notesController.dispose();
    super.onClose();
  }

  void _loadPatient() {
    final patient = _repo.findById(_patientId);
    if (patient == null) {
      Get.back();
      return;
    }
    _original = patient;
    nameController.text = patient.fullName;
    phoneController.text = patient.phone;
    selectedGender.value = patient.gender;
    if (patient.age != null) {
      ageController.text = patient.age.toString();
      selectedQuickAge.value = patient.age;
    }
    addressController.text = patient.address ?? '';
    notesController.text = patient.notes ?? '';
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

  String? validateName(String? value) => Validate.patientNameValidation(value);
  String? validatePhone(String? value) => Validate.mobile10DigitValidation(value);
  String? validateAge(String? value) => Validate.optionalAgeValidation(value);

  Future<void> onSave() async {
    if (isSaving.value || !(formKey.currentState?.validate() ?? false)) {
      return;
    }

    final original = _original;
    if (original == null) {
      return;
    }

    try {
      isSaving.value = true;
      await Future<void>.delayed(const Duration(milliseconds: 500));

      final ageText = ageController.text.trim();
      final age = ageText.isEmpty ? null : int.tryParse(ageText);

      final updated = original.copyWith(
        fullName: nameController.text.trim(),
        phone: phoneController.text.trim(),
        gender: selectedGender.value,
        age: age,
        clearAge: age == null,
        address: addressController.text.trim(),
        clearAddress: addressController.text.trim().isEmpty,
        notes: notesController.text.trim(),
        clearNotes: notesController.text.trim().isEmpty,
      );

      _repo.updatePatient(updated);
      Get.back(result: true);
      Get.snackbar(
        kEditPatientTitle,
        kAddPatientUpdateSuccess,
        snackPosition: SnackPosition.BOTTOM,
        margin: const EdgeInsets.all(16),
        duration: const Duration(seconds: 2),
      );
    } finally {
      isSaving.value = false;
    }
  }
}
