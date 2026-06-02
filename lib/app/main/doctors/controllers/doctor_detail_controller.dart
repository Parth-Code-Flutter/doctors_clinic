import 'package:doctors_clinic/app/main/doctors/data/doctor_repository.dart';
import 'package:doctors_clinic/app/main/doctors/doctor_route_arguments.dart';
import 'package:doctors_clinic/app/main/doctors/models/doctor_model.dart';
import 'package:doctors_clinic/app/main/doctors/models/doctor_status.dart';
import 'package:doctors_clinic/constants/string_constants.dart';
import 'package:doctors_clinic/routes/app_pages.dart';
import 'package:doctors_clinic/utils/ui_utils/app_toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DoctorDetailController extends GetxController {
  final doctor = Rxn<DoctorModel>();
  late String _doctorId;

  DoctorRepository get _repo => Get.find<DoctorRepository>();

  @override
  void onInit() {
    super.onInit();
    _doctorId = Get.arguments?[DoctorRouteArgs.doctorId] as String? ?? '';
    load();
  }

  void load() {
    final found = _repo.findById(_doctorId);
    if (found == null) {
      Get.back();
      return;
    }
    doctor.value = found;
  }

  Future<void> onEdit() async {
    final result = await Get.toNamed(
      Routes.DOCTOR_EDITOR,
      arguments: {DoctorRouteArgs.doctorId: _doctorId},
    );
    if (result == true) {
      load();
    }
  }

  void onMarkAvailable() => _setStatus(DoctorStatus.available, kDoctorMarkedAvailableMessage);
  void onMarkBusy() => _setStatus(DoctorStatus.busy, kDoctorMarkedBusyMessage);
  void onMarkOffDuty() => _setStatus(DoctorStatus.offDuty, kDoctorMarkedOffDutyMessage);

  void _setStatus(DoctorStatus status, String message) {
    _repo.updateStatus(_doctorId, status);
    load();
    showAppToast(
      kDoctorTitle,
      message,
      snackPosition: SnackPosition.BOTTOM,
      margin: const EdgeInsets.all(16),
    );
  }
}
