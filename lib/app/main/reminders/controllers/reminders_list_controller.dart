import 'package:doctors_clinic/app/main/appointments/appointment_route_arguments.dart';
import 'package:doctors_clinic/app/main/reminders/data/reminder_repository.dart';
import 'package:doctors_clinic/app/main/reminders/models/reminder_model.dart';
import 'package:doctors_clinic/constants/string_constants.dart';
import 'package:doctors_clinic/routes/app_pages.dart';
import 'package:doctors_clinic/utils/ui_utils/app_toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RemindersListController extends GetxController {
  final searchController = TextEditingController();
  final searchQuery = ''.obs;
  final activeFilter = ReminderListFilter.today.obs;

  ReminderRepository get _repo => Get.find<ReminderRepository>();

  int get scheduledCount => _repo.countForFilter(ReminderListFilter.scheduled);

  int get sentTodayCount => _repo
      .searchAndFilter(filter: ReminderListFilter.sent)
      .where((r) => r.isDeliverToday)
      .length;

  int get failedCount => _repo.countForFilter(ReminderListFilter.failed);

  List<ReminderModel> get filteredReminders {
    return _repo.searchAndFilter(
      query: searchQuery.value,
      filter: activeFilter.value,
    );
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

  void onFilterSelected(ReminderListFilter filter) {
    activeFilter.value = filter;
  }

  void refreshList() {
    searchQuery.refresh();
  }

  void onReminderTap(ReminderModel reminder) {
    Get.toNamed(
      Routes.APPOINTMENT_DETAIL,
      arguments: {AppointmentRouteArgs.appointmentId: reminder.appointmentId},
    )?.then((_) => refreshList());
  }

  void onRetry(ReminderModel reminder) {
    _repo.retryReminder(reminder.id);
    refreshList();
    showAppToast(
      kRemindersTitle,
      kRemindersRetriedMessage,
      snackPosition: SnackPosition.BOTTOM,
      margin: const EdgeInsets.all(16),
      duration: const Duration(seconds: 2),
    );
  }
}
