import 'package:doctors_clinic/app/main/patients/data/patient_repository.dart';
import 'package:doctors_clinic/app/main/patients/models/patient_model.dart';
import 'package:doctors_clinic/app/main/patients/patient_route_arguments.dart';
import 'package:doctors_clinic/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum PatientListFilter { all, recent, upcoming }

class PatientsTabController extends GetxController {
  final searchController = TextEditingController();
  final searchQuery = ''.obs;
  final activeFilter = PatientListFilter.all.obs;

  PatientRepository get _repo => Get.find<PatientRepository>();

  List<PatientModel> get filteredPatients {
    return _repo.searchAndFilter(
      query: searchQuery.value,
      recentOnly: activeFilter.value == PatientListFilter.recent,
      upcomingOnly: activeFilter.value == PatientListFilter.upcoming,
    );
  }

  int get totalCount => _repo.patients.length;

  bool isNewPatient(PatientModel patient) {
    final weekAgo = DateTime.now().subtract(const Duration(days: 7));
    return patient.createdAt.isAfter(weekAgo);
  }

  @override
  void onInit() {
    super.onInit();
    searchController.addListener(() {
      searchQuery.value = searchController.text;
    });
  }

  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
  }

  void onFilterSelected(PatientListFilter filter) {
    activeFilter.value = filter;
  }

  void refreshList() {
    update();
    searchQuery.refresh();
  }

  Future<void> onAddPatient() async {
    final result = await Get.toNamed(Routes.PATIENT_ADD);
    if (result == true) {
      refreshList();
    }
  }

  void onPatientTap(PatientModel patient) {
    Get.toNamed(
      Routes.PATIENT_PROFILE,
      arguments: {PatientRouteArgs.patientId: patient.id},
    )?.then((_) => refreshList());
  }
}
