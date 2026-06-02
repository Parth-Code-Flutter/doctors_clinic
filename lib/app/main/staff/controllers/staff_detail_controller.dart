import 'package:doctors_clinic/app/main/staff/data/staff_repository.dart';
import 'package:doctors_clinic/app/main/staff/models/staff_member_model.dart';
import 'package:doctors_clinic/app/main/staff/models/staff_status.dart';
import 'package:doctors_clinic/app/main/staff/staff_route_arguments.dart';
import 'package:doctors_clinic/constants/string_constants.dart';
import 'package:doctors_clinic/routes/app_pages.dart';
import 'package:doctors_clinic/utils/ui_utils/app_toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StaffDetailController extends GetxController {
  final member = Rxn<StaffMemberModel>();

  late String _staffId;

  StaffRepository get _repo => Get.find<StaffRepository>();

  @override
  void onInit() {
    super.onInit();
    _staffId = Get.arguments?[StaffRouteArgs.staffId] as String? ?? '';
    load();
  }

  void load() {
    final found = _repo.findById(_staffId);
    if (found == null) {
      Get.back();
      return;
    }
    member.value = found;
  }

  Future<void> onEdit() async {
    final result = await Get.toNamed(
      Routes.STAFF_EDITOR,
      arguments: {StaffRouteArgs.staffId: _staffId},
    );
    if (result == true) {
      load();
    }
  }

  void onMarkActive() =>
      _setStatus(StaffStatus.active, kStaffMarkedActiveMessage);
  void onMarkOnLeave() =>
      _setStatus(StaffStatus.onLeave, kStaffMarkedOnLeaveMessage);
  void onMarkInactive() =>
      _setStatus(StaffStatus.inactive, kStaffMarkedInactiveMessage);

  void _setStatus(StaffStatus status, String message) {
    _repo.updateStatus(_staffId, status);
    load();
    showAppToast(
      kStaffTitle,
      message,
      snackPosition: SnackPosition.BOTTOM,
      margin: const EdgeInsets.all(16),
    );
  }

  void onResetAccess() {
    showAppToast(
      kStaffDetailTitle,
      kStaffResetAccessMessage,
      snackPosition: SnackPosition.BOTTOM,
      margin: const EdgeInsets.all(16),
    );
  }
}
