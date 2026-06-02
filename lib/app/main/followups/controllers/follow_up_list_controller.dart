import 'package:doctors_clinic/app/main/followups/data/follow_up_repository.dart';
import 'package:doctors_clinic/app/main/followups/follow_up_route_arguments.dart';
import 'package:doctors_clinic/app/main/followups/models/follow_up_model.dart';
import 'package:doctors_clinic/constants/string_constants.dart';
import 'package:doctors_clinic/routes/app_pages.dart';
import 'package:doctors_clinic/utils/ui_utils/app_toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FollowUpListController extends GetxController {
  final searchController = TextEditingController();
  final searchQuery = ''.obs;
  final activeFilter = FollowUpListFilter.today.obs;

  FollowUpRepository get _repo => Get.find<FollowUpRepository>();

  int get todayCount => _repo.countForFilter(FollowUpListFilter.today);
  int get upcomingCount => _repo.countForFilter(FollowUpListFilter.upcoming);
  int get completedCount => _repo.countForFilter(FollowUpListFilter.completed);
  int get missedCount => _repo.countForFilter(FollowUpListFilter.missed);

  List<FollowUpModel> get filteredItems => _repo.searchAndFilter(
    query: searchQuery.value,
    filter: activeFilter.value,
  );

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

  void onFilterSelected(FollowUpListFilter filter) {
    activeFilter.value = filter;
  }

  void refreshList() {
    searchQuery.refresh();
  }

  Future<void> onCreate() async {
    final result = await Get.toNamed(Routes.FOLLOW_UP_EDITOR);
    if (result == true) {
      refreshList();
    }
  }

  Future<void> onTap(FollowUpModel item) async {
    await Get.toNamed(
      Routes.FOLLOW_UP_DETAIL,
      arguments: {FollowUpRouteArgs.followUpId: item.id},
    );
    refreshList();
  }

  void onMarkCompleted(FollowUpModel item) {
    _repo.markCompleted(item.id);
    refreshList();
    showAppToast(
      kFollowUpTitle,
      kFollowUpMarkedCompletedMessage,
      snackPosition: SnackPosition.BOTTOM,
      margin: const EdgeInsets.all(16),
    );
  }
}
