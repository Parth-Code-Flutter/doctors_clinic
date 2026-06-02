import 'package:doctors_clinic/app/main/doctors/data/doctor_repository.dart';
import 'package:doctors_clinic/app/main/doctors/doctor_route_arguments.dart';
import 'package:doctors_clinic/app/main/doctors/models/doctor_model.dart';
import 'package:doctors_clinic/app/main/doctors/models/doctor_status.dart';
import 'package:doctors_clinic/constants/string_constants.dart';
import 'package:doctors_clinic/utils/ui_utils/app_toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DoctorEditorController extends GetxController {
  final nameController = TextEditingController();
  final specializationController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final experienceController = TextEditingController();
  final opdController = TextEditingController();
  final notesController = TextEditingController();

  final selectedStatus = DoctorStatus.available.obs;
  final isSaving = false.obs;

  String? _doctorId;

  DoctorRepository get _repo => Get.find<DoctorRepository>();
  List<DoctorStatus> get statuses => DoctorStatus.values;

  @override
  void onInit() {
    super.onInit();
    _doctorId = Get.arguments?[DoctorRouteArgs.doctorId] as String?;
    _seed();
  }

  @override
  void onClose() {
    nameController.dispose();
    specializationController.dispose();
    phoneController.dispose();
    emailController.dispose();
    experienceController.dispose();
    opdController.dispose();
    notesController.dispose();
    super.onClose();
  }

  void _seed() {
    if (_doctorId == null) {
      return;
    }
    final doctor = _repo.findById(_doctorId!);
    if (doctor == null) {
      return;
    }
    nameController.text = doctor.fullName;
    specializationController.text = doctor.specialization;
    phoneController.text = doctor.phone;
    emailController.text = doctor.email ?? '';
    experienceController.text = doctor.experienceLabel ?? '';
    opdController.text = doctor.opdTimings ?? '';
    notesController.text = doctor.notes ?? '';
    selectedStatus.value = doctor.status;
  }

  void onStatusChanged(DoctorStatus? status) {
    if (status == null) {
      return;
    }
    selectedStatus.value = status;
  }

  Future<void> onSave() async {
    if (isSaving.value) {
      return;
    }
    final name = nameController.text.trim();
    final specialization = specializationController.text.trim();
    final phone = phoneController.text.trim();
    if (name.isEmpty || specialization.isEmpty || phone.isEmpty) {
      showAppToast(
        kDoctorEditorTitle,
        kDoctorValidationRequired,
        snackPosition: SnackPosition.BOTTOM,
        margin: const EdgeInsets.all(16),
      );
      return;
    }
    if (!RegExp(r'^\d{10}$').hasMatch(phone)) {
      showAppToast(
        kDoctorEditorTitle,
        kDoctorValidationPhoneInvalid,
        snackPosition: SnackPosition.BOTTOM,
        margin: const EdgeInsets.all(16),
      );
      return;
    }

    try {
      isSaving.value = true;
      await Future<void>.delayed(const Duration(milliseconds: 350));
      final existing = _doctorId != null ? _repo.findById(_doctorId!) : null;
      final doctor = DoctorModel(
        id: existing?.id ?? _repo.newId(),
        fullName: name,
        specialization: specialization,
        phone: phone,
        status: selectedStatus.value,
        email: emailController.text.trim().isEmpty ? null : emailController.text.trim(),
        experienceLabel: experienceController.text.trim().isEmpty
            ? null
            : experienceController.text.trim(),
        opdTimings: opdController.text.trim().isEmpty ? null : opdController.text.trim(),
        notes: notesController.text.trim().isEmpty ? null : notesController.text.trim(),
      );
      _repo.save(doctor);
      Get.back(result: true);
      showAppToast(
        kDoctorEditorTitle,
        kDoctorSavedMessage,
        snackPosition: SnackPosition.BOTTOM,
        margin: const EdgeInsets.all(16),
      );
    } finally {
      isSaving.value = false;
    }
  }
}
