import 'package:doctors_clinic/app/main/followups/data/follow_up_repository.dart';
import 'package:doctors_clinic/app/main/followups/follow_up_route_arguments.dart';
import 'package:doctors_clinic/app/main/followups/models/follow_up_model.dart';
import 'package:doctors_clinic/app/main/followups/models/follow_up_status.dart';
import 'package:doctors_clinic/app/main/patients/data/patient_repository.dart';
import 'package:doctors_clinic/app/main/patients/models/patient_model.dart';
import 'package:doctors_clinic/constants/string_constants.dart';
import 'package:doctors_clinic/utils/ui_utils/app_toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FollowUpEditorController extends GetxController {
  final reasonController = TextEditingController();
  final notesController = TextEditingController();
  final followUpDate = DateTime.now().obs;
  final selectedPatientId = RxnString();
  final isSaving = false.obs;

  String? _followUpId;
  String? _visitId;
  String? _receiptId;

  FollowUpRepository get _repo => Get.find<FollowUpRepository>();
  PatientRepository get _patients => Get.find<PatientRepository>();

  List<PatientModel> get patients => _patients.patients;

  @override
  void onInit() {
    super.onInit();
    _followUpId = Get.arguments?[FollowUpRouteArgs.followUpId] as String?;
    _visitId = Get.arguments?[FollowUpRouteArgs.visitId] as String?;
    _receiptId = Get.arguments?[FollowUpRouteArgs.receiptId] as String?;
    final patientId = Get.arguments?[FollowUpRouteArgs.patientId] as String?;
    _seedInitial(patientId: patientId);
  }

  @override
  void onClose() {
    reasonController.dispose();
    notesController.dispose();
    super.onClose();
  }

  void _seedInitial({String? patientId}) {
    if (_followUpId != null) {
      final existing = _repo.findById(_followUpId!);
      if (existing == null) {
        return;
      }
      selectedPatientId.value = existing.patientId;
      followUpDate.value = existing.scheduledAt;
      reasonController.text = existing.reason ?? '';
      notesController.text = existing.notes ?? '';
      return;
    }
    if (patientId != null && _patients.findById(patientId) != null) {
      selectedPatientId.value = patientId;
    }
  }

  void onPatientChanged(String? id) {
    selectedPatientId.value = id;
  }

  Future<void> onPickDate(BuildContext context) async {
    final initial = followUpDate.value;
    final picked = await showDatePicker(
      context: context,
      initialDate: initial,
      firstDate: DateTime.now().subtract(const Duration(days: 365)),
      lastDate: DateTime.now().add(const Duration(days: 3650)),
    );
    if (picked != null) {
      followUpDate.value = DateTime(
        picked.year,
        picked.month,
        picked.day,
        initial.hour,
        initial.minute,
      );
    }
  }

  Future<void> onSave() async {
    if (isSaving.value) {
      return;
    }
    final patientId = selectedPatientId.value;
    if (patientId == null) {
      showAppToast(
        kFollowUpEditorTitle,
        kFollowUpValidationPatientRequired,
        snackPosition: SnackPosition.BOTTOM,
        margin: const EdgeInsets.all(16),
      );
      return;
    }
    final patient = _patients.findById(patientId);
    if (patient == null) {
      return;
    }
    if (reasonController.text.trim().isEmpty) {
      showAppToast(
        kFollowUpEditorTitle,
        kFollowUpValidationReasonRequired,
        snackPosition: SnackPosition.BOTTOM,
        margin: const EdgeInsets.all(16),
      );
      return;
    }

    try {
      isSaving.value = true;
      await Future<void>.delayed(const Duration(milliseconds: 350));
      final item = FollowUpModel(
        id: _followUpId ?? _repo.newId(),
        patientId: patient.id,
        patientName: patient.fullName,
        patientPhone: patient.phone,
        scheduledAt: followUpDate.value,
        status: FollowUpStatus.scheduled,
        reason: reasonController.text.trim(),
        notes: notesController.text.trim().isEmpty
            ? null
            : notesController.text.trim(),
        visitId: _visitId,
        receiptId: _receiptId,
      );
      _repo.save(item);
      Get.back(result: true);
      showAppToast(
        kFollowUpEditorTitle,
        kFollowUpSavedMessage,
        snackPosition: SnackPosition.BOTTOM,
        margin: const EdgeInsets.all(16),
      );
    } finally {
      isSaving.value = false;
    }
  }
}
