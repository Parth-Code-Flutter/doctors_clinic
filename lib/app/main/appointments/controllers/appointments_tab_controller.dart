import 'package:doctors_clinic/app/main/appointments/appointment_route_arguments.dart';
import 'package:doctors_clinic/app/main/appointments/data/appointment_repository.dart';
import 'package:doctors_clinic/app/main/appointments/models/appointment_model.dart';
import 'package:doctors_clinic/app/main/appointments/utils/appointment_format_utils.dart';
import 'package:doctors_clinic/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppointmentsTabController extends GetxController {
  final searchController = TextEditingController();
  final searchQuery = ''.obs;
  final activeFilter = AppointmentListFilter.today.obs;

  AppointmentRepository get _repo => Get.find<AppointmentRepository>();

  int get todayCount => _repo.countForFilter(AppointmentListFilter.today);

  int get upcomingCount => _repo.countForFilter(AppointmentListFilter.upcoming);

  List<AppointmentModel> get filteredAppointments {
    return _repo.searchAndFilter(
      query: searchQuery.value,
      filter: activeFilter.value,
    );
  }

  Map<String, List<AppointmentModel>> get groupedAppointments {
    final map = <String, List<AppointmentModel>>{};
    for (final appointment in filteredAppointments) {
      final key = AppointmentFormatUtils.formatDayKey(appointment.scheduledAt);
      map.putIfAbsent(key, () => []).add(appointment);
    }
    return map;
  }

  List<String> get sortedDayKeys {
    final keys = groupedAppointments.keys.toList();
    keys.sort();
    return keys;
  }

  String sectionTitleForKey(String key) {
    final parts = key.split('-');
    if (parts.length != 3) {
      return key;
    }
    final date = DateTime(
      int.parse(parts[0]),
      int.parse(parts[1]),
      int.parse(parts[2]),
    );
    return AppointmentFormatUtils.daySectionTitle(date);
  }

  @override
  void onInit() {
    super.onInit();
    searchController.addListener(
      () => searchQuery.value = searchController.text,
    );
  }

  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
  }

  void onFilterSelected(AppointmentListFilter filter) {
    activeFilter.value = filter;
  }

  void refreshList() {
    searchQuery.refresh();
  }

  Future<void> onBookAppointment({String? patientId}) async {
    final result = await Get.toNamed(
      Routes.APPOINTMENT_ADD,
      arguments: patientId != null
          ? {AppointmentRouteArgs.patientId: patientId}
          : null,
    );
    if (result == true) {
      refreshList();
    }
  }

  void onAppointmentTap(AppointmentModel appointment) {
    Get.toNamed(
      Routes.APPOINTMENT_DETAIL,
      arguments: {AppointmentRouteArgs.appointmentId: appointment.id},
    )?.then((_) => refreshList());
  }
}
