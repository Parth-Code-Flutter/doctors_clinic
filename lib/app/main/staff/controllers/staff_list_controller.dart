import 'package:doctors_clinic/app/main/staff/data/staff_repository.dart';
import 'package:doctors_clinic/app/main/staff/models/staff_member_model.dart';
import 'package:doctors_clinic/app/main/staff/models/staff_status.dart';
import 'package:doctors_clinic/app/main/staff/staff_route_arguments.dart';
import 'package:doctors_clinic/constants/string_constants.dart';
import 'package:doctors_clinic/routes/app_pages.dart';
import 'package:doctors_clinic/utils/ui_utils/app_toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StaffListController extends GetxController {
  final searchController = TextEditingController();
  final searchQuery = ''.obs;
  final activeFilter = StaffListFilter.active.obs;

  StaffRepository get _repo => Get.find<StaffRepository>();

  int get totalCount => _repo.members.length;
  int get activeCount => _repo.countForFilter(StaffListFilter.active);
  int get onLeaveCount => _repo.countForFilter(StaffListFilter.onLeave);
  int get inactiveCount => _repo.countForFilter(StaffListFilter.inactive);

  List<StaffMemberModel> get filteredMembers => _repo.searchAndFilter(
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

  void onFilterSelected(StaffListFilter filter) {
    activeFilter.value = filter;
  }

  void refreshList() {
    searchQuery.refresh();
  }

  Future<void> onAddStaff() async {
    final result = await Get.toNamed(Routes.STAFF_EDITOR);
    if (result == true) {
      refreshList();
    }
  }

  Future<void> onMemberTap(StaffMemberModel member) async {
    await Get.toNamed(
      Routes.STAFF_DETAIL,
      arguments: {StaffRouteArgs.staffId: member.id},
    );
    refreshList();
  }

  void onQuickDeactivate(StaffMemberModel member) {
    _repo.updateStatus(member.id, StaffStatus.inactive);
    refreshList();
    showAppToast(
      kStaffTitle,
      kStaffMarkedInactiveMessage,
      snackPosition: SnackPosition.BOTTOM,
      margin: const EdgeInsets.all(16),
    );
  }
}
