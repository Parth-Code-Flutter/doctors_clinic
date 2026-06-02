import 'package:doctors_clinic/app/main/doctors/data/doctor_repository.dart';
import 'package:doctors_clinic/app/main/doctors/doctor_route_arguments.dart';
import 'package:doctors_clinic/app/main/doctors/models/doctor_model.dart';
import 'package:doctors_clinic/app/main/doctors/models/doctor_status.dart';
import 'package:doctors_clinic/constants/string_constants.dart';
import 'package:doctors_clinic/routes/app_pages.dart';
import 'package:doctors_clinic/utils/ui_utils/app_toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DoctorListController extends GetxController {
  final searchController = TextEditingController();
  final searchQuery = ''.obs;
  final activeFilter = DoctorListFilter.available.obs;

  DoctorRepository get _repo => Get.find<DoctorRepository>();

  int get totalCount => _repo.doctors.length;
  int get availableCount => _repo.countForFilter(DoctorListFilter.available);
  int get busyCount => _repo.countForFilter(DoctorListFilter.busy);
  int get offDutyCount => _repo.countForFilter(DoctorListFilter.offDuty);

  List<DoctorModel> get filteredDoctors =>
      _repo.searchAndFilter(query: searchQuery.value, filter: activeFilter.value);

  @override
  void onInit() {
    super.onInit();
    searchController.addListener(() => searchQuery.value = searchController.text);
  }

  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
  }

  void onFilterSelected(DoctorListFilter filter) {
    activeFilter.value = filter;
  }

  void refreshList() => searchQuery.refresh();

  Future<void> onAddDoctor() async {
    final result = await Get.toNamed(Routes.DOCTOR_EDITOR);
    if (result == true) {
      refreshList();
    }
  }

  Future<void> onDoctorTap(DoctorModel doctor) async {
    await Get.toNamed(
      Routes.DOCTOR_DETAIL,
      arguments: {DoctorRouteArgs.doctorId: doctor.id},
    );
    refreshList();
  }

  void onQuickOffDuty(DoctorModel doctor) {
    _repo.updateStatus(doctor.id, DoctorStatus.offDuty);
    refreshList();
    showAppToast(
      kDoctorTitle,
      kDoctorMarkedOffDutyMessage,
      snackPosition: SnackPosition.BOTTOM,
      margin: const EdgeInsets.all(16),
    );
  }
}
