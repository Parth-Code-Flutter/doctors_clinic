import 'package:doctors_clinic/app/main/appointments/data/appointment_repository.dart';
import 'package:doctors_clinic/app/main/patients/data/patient_repository.dart';
import 'package:doctors_clinic/app/main/patients/models/patient_model.dart';
import 'package:doctors_clinic/app/main/visits/models/prescription_item_model.dart';
import 'package:doctors_clinic/app/main/visits/models/visit_record_model.dart';
import 'package:doctors_clinic/app/main/visits/visit_route_arguments.dart';
import 'package:doctors_clinic/app/main/visits/data/visit_repository.dart';
import 'package:doctors_clinic/constants/string_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VisitEditorController extends GetxController {
  final complaintController = TextEditingController();
  final notesController = TextEditingController();
  final diagnosisController = TextEditingController();
  final followUpController = TextEditingController();
  final medicineController = TextEditingController();
  final dosageController = TextEditingController();
  final frequencyController = TextEditingController();
  final durationController = TextEditingController();
  final instructionController = TextEditingController();

  final visitDate = DateTime.now().obs;
  final selectedPatientId = RxnString();
  final prescriptionItems = <PrescriptionItemModel>[].obs;
  final isSaving = false.obs;

  String? _visitId;
  String? _appointmentId;

  VisitRepository get _repo => Get.find<VisitRepository>();
  PatientRepository get _patients => Get.find<PatientRepository>();
  AppointmentRepository get _appointments => Get.find<AppointmentRepository>();

  List<PatientModel> get patients => _patients.patients;

  @override
  void onInit() {
    super.onInit();
    _visitId = Get.arguments?[VisitRouteArgs.visitId] as String?;
    _appointmentId = Get.arguments?[VisitRouteArgs.appointmentId] as String?;
    final patientId = Get.arguments?[VisitRouteArgs.patientId] as String?;
    _seedInitialValues(patientId: patientId);
  }

  @override
  void onClose() {
    complaintController.dispose();
    notesController.dispose();
    diagnosisController.dispose();
    followUpController.dispose();
    medicineController.dispose();
    dosageController.dispose();
    frequencyController.dispose();
    durationController.dispose();
    instructionController.dispose();
    super.onClose();
  }

  void _seedInitialValues({String? patientId}) {
    if (_visitId != null) {
      final existing = _repo.findById(_visitId!);
      if (existing == null) {
        return;
      }
      selectedPatientId.value = existing.patientId;
      visitDate.value = existing.visitAt;
      complaintController.text = existing.chiefComplaint ?? '';
      notesController.text = existing.clinicalNotes ?? '';
      diagnosisController.text = existing.diagnosis ?? '';
      followUpController.text = existing.followUpAdvice ?? '';
      prescriptionItems.assignAll(existing.prescription);
      return;
    }

    if (_appointmentId != null) {
      final appointment = _appointments.findById(_appointmentId!);
      if (appointment != null) {
        selectedPatientId.value = appointment.patientId;
        complaintController.text = appointment.reason ?? '';
        notesController.text = appointment.notes ?? '';
      }
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
    final picked = await showDatePicker(
      context: context,
      initialDate: visitDate.value,
      firstDate: DateTime.now().subtract(const Duration(days: 3650)),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    if (picked != null) {
      visitDate.value = DateTime(
        picked.year,
        picked.month,
        picked.day,
        visitDate.value.hour,
        visitDate.value.minute,
      );
    }
  }

  void onAddMedicine() {
    final medicine = medicineController.text.trim();
    final dosage = dosageController.text.trim();
    final frequency = frequencyController.text.trim();
    final duration = durationController.text.trim();
    final instructions = instructionController.text.trim();
    if (medicine.isEmpty ||
        dosage.isEmpty ||
        frequency.isEmpty ||
        duration.isEmpty) {
      Get.snackbar(
        kVisitEditorTitle,
        kVisitValidationMedicineRequired,
        snackPosition: SnackPosition.BOTTOM,
        margin: const EdgeInsets.all(16),
      );
      return;
    }
    prescriptionItems.add(
      PrescriptionItemModel(
        medicine: medicine,
        dosage: dosage,
        frequency: frequency,
        duration: duration,
        instructions: instructions.isEmpty ? null : instructions,
      ),
    );
    medicineController.clear();
    dosageController.clear();
    frequencyController.clear();
    durationController.clear();
    instructionController.clear();
  }

  void onRemoveMedicine(int index) {
    if (index < 0 || index >= prescriptionItems.length) {
      return;
    }
    prescriptionItems.removeAt(index);
  }

  Future<void> onSaveVisit() async {
    if (isSaving.value) {
      return;
    }
    final patientId = selectedPatientId.value;
    if (patientId == null) {
      Get.snackbar(
        kVisitEditorTitle,
        kVisitValidationPatientRequired,
        snackPosition: SnackPosition.BOTTOM,
        margin: const EdgeInsets.all(16),
      );
      return;
    }
    final patient = _patients.findById(patientId);
    if (patient == null) {
      return;
    }
    if (complaintController.text.trim().isEmpty &&
        diagnosisController.text.trim().isEmpty &&
        prescriptionItems.isEmpty) {
      Get.snackbar(
        kVisitEditorTitle,
        kVisitValidationContentRequired,
        snackPosition: SnackPosition.BOTTOM,
        margin: const EdgeInsets.all(16),
      );
      return;
    }

    try {
      isSaving.value = true;
      await Future<void>.delayed(const Duration(milliseconds: 350));
      final record = VisitRecordModel(
        id: _visitId ?? _repo.newId(),
        patientId: patient.id,
        patientName: patient.fullName,
        patientPhone: patient.phone,
        visitAt: visitDate.value,
        appointmentId: _appointmentId,
        chiefComplaint: complaintController.text.trim().isEmpty
            ? null
            : complaintController.text.trim(),
        clinicalNotes: notesController.text.trim().isEmpty
            ? null
            : notesController.text.trim(),
        diagnosis: diagnosisController.text.trim().isEmpty
            ? null
            : diagnosisController.text.trim(),
        followUpAdvice: followUpController.text.trim().isEmpty
            ? null
            : followUpController.text.trim(),
        prescription: List<PrescriptionItemModel>.from(prescriptionItems),
      );
      _repo.save(record);
      Get.back(result: true);
      Get.snackbar(
        kVisitEditorTitle,
        kVisitSavedMessage,
        snackPosition: SnackPosition.BOTTOM,
        margin: const EdgeInsets.all(16),
      );
    } finally {
      isSaving.value = false;
    }
  }
}
