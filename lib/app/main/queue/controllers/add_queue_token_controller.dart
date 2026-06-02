import 'package:doctors_clinic/app/main/patients/data/patient_repository.dart';
import 'package:doctors_clinic/app/main/patients/models/patient_model.dart';
import 'package:doctors_clinic/app/main/queue/data/queue_repository.dart';
import 'package:doctors_clinic/constants/string_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddQueueTokenController extends GetxController {
  final reasonController = TextEditingController();
  final notesController = TextEditingController();

  final selectedPatientId = RxnString();
  final isPriority = false.obs;
  final isSaving = false.obs;

  PatientRepository get _patientsRepo => Get.find<PatientRepository>();
  QueueRepository get _queueRepo => Get.find<QueueRepository>();

  List<PatientModel> get patients => _patientsRepo.patients;

  @override
  void onClose() {
    reasonController.dispose();
    notesController.dispose();
    super.onClose();
  }

  void onPatientChanged(String? patientId) {
    selectedPatientId.value = patientId;
  }

  void onPriorityChanged(bool value) {
    isPriority.value = value;
  }

  Future<void> onCreateToken() async {
    if (isSaving.value) {
      return;
    }
    final patientId = selectedPatientId.value;
    if (patientId == null) {
      Get.snackbar(
        kQueueAddTitle,
        kQueueValidationPatientRequired,
        snackPosition: SnackPosition.BOTTOM,
        margin: const EdgeInsets.all(16),
        duration: const Duration(seconds: 2),
      );
      return;
    }
    final patient = _patientsRepo.findById(patientId);
    if (patient == null) {
      return;
    }

    try {
      isSaving.value = true;
      await Future<void>.delayed(const Duration(milliseconds: 300));
      _queueRepo.addToken(
        patient: patient,
        reason: reasonController.text.trim(),
        notes: notesController.text.trim(),
        isPriority: isPriority.value,
      );
      Get.back(result: true);
    } finally {
      isSaving.value = false;
    }
  }
}
